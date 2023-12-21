Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGXZSCWAMGQERDI667I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mail.lfdr.de (Postfix) with ESMTPS id E180D81B754
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:43 +0100 (CET)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-203ff4c8936sf783315fac.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165083; cv=pass;
        d=google.com; s=arc-20160816;
        b=AbVVvGqlJRfVOffn+dEvcDRgJtrmsmx8FhoyyDXCHRBNxxuF+rR+Jo7SVj1TNpZlj1
         ebf57CXIYa6RMaoaTWSJPQCO7VED33+zoHkUOnw7mX1AI4uuNEdDwO84anTYV/9IyJtb
         ZS1KZArnIEQB2bpwO+3RUgeDob2QGgcNrDeEbjmItWQHOZrzli689Obze6R4jLheweUU
         mU7MYF4spRgJrNthpKUdTZG4qyQ9pWM6+ir8SLbuks4I2ec0XAG1rwpC2NI05JVoC5rc
         ufqzQ6bt9E7YFUUEKTKXoG4JzCscHxNQe5R6y7dXMoBLzgEoKpEhrnsJv6C8/yvO0dGH
         NF/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=CgJoxkExnRJomAL4j2hW4BPBbyIWqLJ2Q/IyXDxLAuo=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=LCAnGN81rGyajwgza3d+Tu8v5HGvEoCmhupz78F93sZTihKWuWGQeHtq3QRZt2ISrN
         1byy5JdY7/IneFchIw6X+JhZrBC3q6H1QFiYh1yh4QNIWIOZlJo5u0BKR08Xg26Ej8gB
         bV6MVRuq7PwOoQotuJ6TVysS4AErXVoqmLrP9lzIaowvRgDd42K+DFQLGJ5n22b7yEjt
         i2pHcEButP7lYoH1rE3vtOOu9Q0HwSmZ6cMackolkHK+YpmA+dC5bPh2SrU2V35p5iLO
         /DeNYNlcitK41HIKEnkMQ2mZKOqyG3+Ve5ufmM8ekj23op1gntlBTkBwkBtN4SJfYsnb
         ZJwg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165083; x=1703769883;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgJoxkExnRJomAL4j2hW4BPBbyIWqLJ2Q/IyXDxLAuo=;
        b=UlChOQ/MhSV0dJfVKLedau/WXvqfT70LlQEsTKDrYkArEOnBuQd4E+kkJHh/wUPL2F
         54uTT9jMHCj9thWyLlRr5sMB/wwEYBqj+Yptl2QdU4XQI+hK2xfKd3g8Q81KWrJ4XdtQ
         aD1x/xSdKPHMpT9J5WWj9PZ7/0KJqaQ4Bhq2WySDReYYY3RfvEiNpgN1WHAo7SngZGQB
         hFldBTKFcEFOZmInZgXqouwnCbwy1B5vR2Zb7yRRAyZ2DgRi/WXbE1ST38w7IYPWFzDt
         YS6V3XZ2YNdhzHhW/h1tNrWAbTAPtaiJ8zwyq0Wpz1AgLwFd0Py5uETn/5oqR87Z/Qel
         6phg==
X-Gm-Message-State: AOJu0YyKjR3eZoyzz4ynMM9eTIT+ZJ4xByaYAXSgPKhVbwp8F3eg4nkm
	Z7tCmi8eujUk17hBldGoN2iOzw==
X-Google-Smtp-Source: AGHT+IGgrnlc9hQzU3rbWUvDDlcTn1+tJkean264pnNwv7VzaYlDzfuFwZHwFGaANvkQ/T95k/R6QA==
X-Received: by 2002:a05:6870:c0c9:b0:203:10ab:f237 with SMTP id e9-20020a056870c0c900b0020310abf237mr1170824oad.33.1703165082691;
        Thu, 21 Dec 2023 05:24:42 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6871:521e:b0:203:7c15:95ae with SMTP id
 ht30-20020a056871521e00b002037c1595aels1225692oac.0.-pod-prod-03-us; Thu, 21
 Dec 2023 05:24:42 -0800 (PST)
X-Received: by 2002:a05:6358:889:b0:172:e164:93fa with SMTP id m9-20020a056358088900b00172e16493famr1568177rwj.50.1703165082164;
        Thu, 21 Dec 2023 05:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165082; cv=none;
        d=google.com; s=arc-20160816;
        b=rADzDRj8VuSrPqhg3admE4WqlqCxxiBRvYVv3BpweYzrKRnKhf3U8QbpEglF62fQyP
         hRIsPFEqN/uGRtQDc53yaKkn07GhEBjo2O8jRHEAbPCx8NtekTc96bqKDpFbOsZ8ejVk
         abmDMI3FOEpSh1cq7Tp0TR69RAZ2TELb1zBWlYSTEuVhKlBf3Km4DCQzG+sZlZMIZRbU
         JHthCqlAFmayQE6CB/QowknfEmE0v7KngFxFmqbzBqwgvlc9cxL4Fe9bFp8eqJ98lZ0Z
         yy5TMD9HiI3U+KDeDpC2k9DRUxbirJnujV1Ak6jFpb05V3MImuMlvICU8QI3OveY5A9T
         RzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=OUiNmCjPvqOiTp/4UL00+cVpBnekg0L/g2EBDkgOp3k=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=X7PaFlT+klH1X8sxvocZkhFJ+lG0U0dcS98ubttZC3FmG8rBS8q3mc4RTZ08c7SU9l
         Cq+/f9GxJLE0yP1+tcQpaikgKWUcc75743NKZ3d19kSpudUG/Z66zeoGZ/gc/I922Jnb
         hMpb/wEHcilYV8GX1WDmdBYFLAEj/cJLsrTDxhbzKbysqJQghnFJbWPxSyV9MzWQK1lN
         HkkhcBL/jaOFbmbwsP3De26p76joFlHtZhKSd60DchGpm+Ib87f2xlzTRIsmKxENrtsn
         MCgR6tPFBR9Bj/owZR4EZXdy/e8My1oZJQaoDiTl8aOUTrNWFaNTAX6oiPl/O0lRQoJP
         YsDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id b10-20020ac87fca000000b00425a5000a7csi2090183qtk.497.2023.12.21.05.24.42
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:42 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-_doMg-EuMoGL92VX0uz7dg-1; Thu, 21 Dec 2023 08:24:40 -0500
X-MC-Unique: _doMg-EuMoGL92VX0uz7dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 666A685A58B
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 6217840C6E2C; Thu, 21 Dec 2023 13:24:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FD1B40C6EB9;
	Thu, 21 Dec 2023 13:24:37 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/40] netfs: Allow the netfs to make the io (sub)request alloc larger
Date: Thu, 21 Dec 2023 13:23:04 +0000
Message-ID: <20231221132400.1601991-10-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Allow the network filesystem to specify extra space to be allocated on the
end of the io (sub)request.  This allows cifs, for example, to use this
space rather than allocating its own cifs_readdata struct.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 7 +++++--
 include/linux/netfs.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 85f428fc52e6..c4229c5f3f54 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -22,7 +22,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct netfs_io_request *rreq;
 	int ret;
 
-	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
+	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
+		       GFP_KERNEL);
 	if (!rreq)
 		return ERR_PTR(-ENOMEM);
 
@@ -114,7 +115,9 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 {
 	struct netfs_io_subrequest *subreq;
 
-	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
+	subreq = kzalloc(rreq->netfs_ops->io_subrequest_size ?:
+			 sizeof(struct netfs_io_subrequest),
+			 GFP_KERNEL);
 	if (subreq) {
 		INIT_LIST_HEAD(&subreq->rreq_link);
 		refcount_set(&subreq->ref, 2);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 7244ddebd974..d6f27000eeb0 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -210,6 +210,8 @@ struct netfs_io_request {
  * Operations the network filesystem can/must provide to the helpers.
  */
 struct netfs_request_ops {
+	unsigned int	io_request_size;	/* Alloc size for netfs_io_request struct */
+	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

