from flask import Flask, render_template, json, request, send_file, make_response
import os
import json
import subprocess
from youtube import *

app = Flask(__name__)
no_of_files = 0
file_list = []


@app.route("/")
def main():
    return render_template('index.html')


@app.route('/getfile', methods=['POST'])
def getfile():
    files = os.listdir("./download")
    global no_of_files
    global file_list
    disk_root = getDf()
    file_json = {'no_of_files': len(files), 'total_space':disk_root[1], 'used_space':disk_root[2], 'available_space':disk_root[3], 'files': []}    # initialize json object
    with open('files.json', 'w') as update_json:  # to create json file
        count=0
        for i in file_list:
            with open('download/text/'+str(i)+'.txt', 'r') as text_file:
                lineList = text_file.readlines()
                if len(lineList) > 1:
                    file_json['files'].append({
                        'id': 0,
                        'name': lineList[len(lineList)-1],
                        'percentage': str(i)+'.txt',
                        'size': '100'
                    })
        for i in files:
            if i == "__pycache__" or i == "text":
                continue
            count = count + 1
            file_size = os.stat("./download/"+i).st_size
            file_size = int(file_size / 1000)
            # print(file_size)
            file_json['files'].append({
                'id': count,
                'name': i,
                'percentage': '100',
                'size': file_size
            })
        json.dump(file_json, update_json)
    with open('files.json', 'r') as json_file:  # to send json file
        json_file = json.load(json_file)
        try:
            return json.dumps(json_file)
        except Exception as e:
            return str(e)


@app.route('/remove_file', methods=['POST'])
def remove_file():
    file_name = request.form
    file_name = "./download/"+file_name["is_delete"]
    os.remove(file_name)  # file name passed here will be deleted using ajax
    return json.dumps({'status': 'deleted', 'file name': file_name})


@app.route('/remove_text_file', methods=['POST'])
def remove_text_file():
    global file_list
    file_name = request.form
    temp = file_name["is_delete"].split('.')
    file_name = "./download/text/"+file_name["is_delete"]
    os.remove(file_name)  # file name passed here will be deleted using ajax
    file_list.remove(int(temp[0]))
    return json.dumps({'status': 'deleted', 'file name': file_name})


@app.route('/download_file/<file_id>')
def download_file(file_id):
    display_name = ''
    file_id = int(file_id)
    with open('files.json', 'r') as json_file:
        json_file = json.load(json_file)
        for i in json_file["files"]:
            if i["id"] == file_id:
                display_name = i["name"]
                break
    file_basename = display_name
    file_size = os.path.getsize(file_path)
    response = make_response()
    response.headers['Content-Description'] = 'File Transfer'
    response.headers['Cache-Control'] = 'no-cache'
    response.headers['Content-Type'] = 'application/octet-stream'
    response.headers['Content-Disposition'] = 'attachment; filename=%s' % file_basename
    response.headers['Content-Length'] = file_size
    response.headers['X-Accel-Redirect'] = "/download/"+display_name # nginx: http://wiki.nginx.org/NginxXSendfile
    return response


@app.route('/start_download',methods=['POST'])
def start_download():
    link_address = request.form
    link_address = link_address["download_link"]
    global no_of_files
    global file_list
    f= open("download/text/"+str(no_of_files)+".txt","w+")
    f.write("Your download is Starting..")
    f.close()
    file_list.append(no_of_files)
    output = subprocess.call('youtube-dl -o "download/%(title)s.%(ext)s" ' + link_address + ' > download/text/'+str(no_of_files)+'.txt &', shell=True)
    no_of_files = no_of_files + 1
    return "started downloading"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
