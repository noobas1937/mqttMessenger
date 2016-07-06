CREATE TABLE dbo.TB_MQTT_PUBLISHMSG (
    PUBLISH_IDX  INT IDENTITY(1,1) NOT NULL, 
    MSG_ID       INT, 
    CLIENT_ID    VARCHAR(50), 
    TOPIC        VARCHAR(50), 
    QOS          INT, 
    MESSAGE      NVARCHAR(255), 
    RETAIN_YN    CHAR(1) CONSTRAINT DF__TB_MQTT_P__RETAI__084B3915 DEFAULT ('N'), 
 CONSTRAINT PK_TB_MQTT_PUBLISHMSG 
   PRIMARY KEY CLUSTERED (PUBLISH_IDX ASC) ON [PRIMARY]
) ON [PRIMARY]

EXEC sp_addextendedproperty N'MS_Description', N'보내야할 구독자 및 메세지 정보', N'schema', N'dbo', N'table', N'TB_MQTT_PUBLISHMSG';

EXEC sp_addextendedproperty N'MS_Description', N'고유번호', N'schema', N'dbo', N'table', N'TB_MQTT_PUBLISHMSG', N'column', N'PUBLISH_IDX';



CREATE TABLE dbo.TB_MQTT_STOREDPUBLISHMSG (
    STOREDMSG_IDX  INT IDENTITY(1,1) NOT NULL, 
    CLIENT_ID      VARCHAR(50), 
    TOPIC          NVARCHAR(50), 
    QOS            INT, 
    MESSAGE        NVARCHAR(255), 
    RETAIN_YN      CHAR(1) CONSTRAINT DF__TB_MQTT_S__RETAI__79FD19BE DEFAULT ('N'), 
    MSG_ID         INT NOT NULL, 
 CONSTRAINT PK_TB_MQTT_STOREDPUBLISHMSG 
   PRIMARY KEY CLUSTERED (STOREDMSG_IDX ASC) ON [PRIMARY]
) ON [PRIMARY]

EXEC sp_addextendedproperty N'MS_Description', N'Qos2로 보낸 메세지를 저장 한다.', N'schema', N'dbo', N'table', N'TB_MQTT_STOREDPUBLISHMSG';


CREATE TABLE dbo.TB_MQTT_SUBSCRIPTION (
    CLIENT_ID        VARCHAR(50) NOT NULL, 
    TOPIC            VARCHAR(50) NOT NULL, 
    QOS              INT, 
    CLEANSESSION_YN  CHAR(1) CONSTRAINT Def_TB_MQTT_SUBSCRIPTION_CLEANSESSION_YN DEFAULT ('N'), 
    ACTIVY_YN        CHAR(1) CONSTRAINT Def_TB_MQTT_SUBSCRIPTION_ACTIVY_YN DEFAULT ('N'), 
 CONSTRAINT PK_TB_MQTT_SUBSCRIPTION 
   PRIMARY KEY CLUSTERED (CLIENT_ID ASC, TOPIC ASC) ON [PRIMARY]
) ON [PRIMARY]

EXEC sp_addextendedproperty N'MS_Description', N'해당 토픽을 전달 받을지 말지에 대한 flag값', N'schema', N'dbo', N'table', N'TB_MQTT_SUBSCRIPTION', N'column', N'ACTIVY_YN';



CREATE TABLE dbo.TB_MQTT_SUBSCRIPTION_USER (
    CLIENT_ID  NVARCHAR(50) NOT NULL, 
 CONSTRAINT PK_TB_MQTT_SUBSCRIPTION_USER 
   PRIMARY KEY CLUSTERED (CLIENT_ID ASC) ON [PRIMARY]
) ON [PRIMARY]
