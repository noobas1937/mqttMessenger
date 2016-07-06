package com.msp.chat.core.mqtt.proto.messages;

/**
 * Doesn't care DUP, QOS and RETAIN flags.
 * 
 * @author andrea
 */
public class PingReqMessage extends ZeroLengthMessage {
    
    public PingReqMessage() {
        m_messageType = AbstractMessage.PINGREQ;
    }
}
