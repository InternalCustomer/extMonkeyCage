FROM registry.stage1.ng.bluemix.net/ibmnode:latest

#RUN mkdir MonkeyCage
RUN mkdir /public
#RUN mkdir MonkeyCage/node_modules
#ADD cloud-key.pub /
ADD *.yml /
ADD *.js /
ADD *.json /
ADD public/* /public/
#ADD MonkeyCage/node_modules/*.tar.gz /MonkeyCage/node_modules/


# fix error when installing node-xmpp
#COPY cloud-key.pub /root/.ssh/
#RUN cat /root/.ssh/cloud-key.pub >> /root/.ssh/authorized_keys
RUN npm cache clean
RUN npm install --production


WORKDIR /
EXPOSE 80
EXPOSE 3000

#CMD ["node","app.js"]
#ENTRYPOINT ["supervisord"]
ENTRYPOINT ["node", "app.js"]
