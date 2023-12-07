Return-Path: <linux-cachefs+bncBDLIXLMFVAERBHPPZCVQMGQEB5QVIOY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ACA809343
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:38 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4258ff0106dsf10667241cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984157; cv=pass;
        d=google.com; s=arc-20160816;
        b=lNHTEtE3lSEnCd4gbvxh6FlvTaOt5YFYxhkMjDgdr3PLccpHjFC7BgyRyrKopa71T1
         Xc+mIzY28oUOar1Jye41o3cpfxhqP+Z+Gmpfs/drS70Lo/Xtn5UwvIN9CRNiKGzCoX+0
         olxCCsfPHrwCmcDvfgZMKGJ3H3nQTaHA4apW+JV2EXSN2G1COdHgEfxFrtnFkb+thBoj
         Iz0Wn2AhRVw0N8vdeIQRdtO45W2JbbC9bG58iCHdPHwytj1ymC+dNG4VzIw31+6e0dog
         FgIZUz8KqrEuqn6u1r93lYdHObrBihAbiffo69zzO6KfReNmg77M7Sz5Dc7oEIdCxTdg
         FfbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=LLOPmn24fD8ychxqBPm0k/loUGGaoX3Y4YWst4+LyZY=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=MQGttUdX6JSf4d9qfPBk+rJYqBVMhR7hA3OPPsABcuEY3mbPw5pMSFVJbCNQ6H7Pdc
         elAKUn6Bx/EyzxJ5UK28yxfVY6LLpMDrlmBH6rY/gg8/aqax4o3flf/CMR5R+jfdLqbI
         JjTL1fYUrrDHylEbBfsqWYZtrdFTOx2Gyaa8Q6FZvmgd6E3i9lkUwEXrRKdrRxjcj0lv
         VigK3g11hytCiOVWWiWI7usArguI3vqaYSg5L1OoTfJPZqwAPWbdYRgiJl2mN1HoBLf/
         nsJYYuP1EySV1SED7l8aL86+OGSa5b05mRvZbky87d6dNSNJkBeLYOU6PjtpWDZHbMz7
         vdbg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984157; x=1702588957;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLOPmn24fD8ychxqBPm0k/loUGGaoX3Y4YWst4+LyZY=;
        b=KBr51ljpBOvyS7A1sVKhvF7YAYiK0h5Bkbzp723TKLci92lDJsY2EvCH5FkTE6Xd/m
         V2j9hplKgtb40uqIhPuLaajsCUMwyTFqFm13Bh9m268GKhvNi8JlrNEMlCkednvoQePR
         xJUxwbQQe+b+quumZll4bjVHrhjhlzsp+tas6HVX2E1FE+X2SkHoz26X1TG7ZkDlRxpr
         nFB8mF1GGSvfP7+xfua7d7gZJfuYuqUO/VjEjKHO529rdnhRQMx4do2X9JOvkCU64OAj
         yBbu/Q9KhHLW+X0gPUJv6Y5G5p5HhE3wW33/IDtsk+rggtdD79NiR9T7BMWuXxTn3VTl
         cgPg==
X-Gm-Message-State: AOJu0YyHmGrAob5PjVc+pH6iqdRLjU0/iArEhaatawRhFj0IrfpYuv32
	Pff8osgJYVPRZ4DJW4BOr/5fkw==
X-Google-Smtp-Source: AGHT+IGexnQemilWOkXE5FiWJXvBGO4ttrJRkIJ3Fb3LJcPNoFLTSMkEPsXmxlM70VgfTGClQdR4ew==
X-Received: by 2002:a05:622a:120f:b0:425:4043:41cc with SMTP id y15-20020a05622a120f00b00425404341ccmr3584406qtx.120.1701984157361;
        Thu, 07 Dec 2023 13:22:37 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa4:b0:423:e09f:e8dd with SMTP id
 s36-20020a05622a1aa400b00423e09fe8ddls1618287qtc.0.-pod-prod-04-us; Thu, 07
 Dec 2023 13:22:37 -0800 (PST)
X-Received: by 2002:ae9:f80f:0:b0:77e:fba3:81e5 with SMTP id x15-20020ae9f80f000000b0077efba381e5mr2128179qkh.123.1701984156837;
        Thu, 07 Dec 2023 13:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984156; cv=none;
        d=google.com; s=arc-20160816;
        b=akmzYtF1g+fJUT1x9+AMZ8dXazI4XbpvjbiYxJhzlCeaQrV3Di+ycdogWigNo9D/v+
         xqd9YsSD89+g0PelkI4BpMTPOxj6TpKoso3Y/gJEpiHdLJXnijKiQrPPvWRHYeRdr0XA
         a61OQ7A4fE8/Y7fU7/swREa8zstwVm8FcATfNySkRbgwrgu/dxSrORIFro0YvSSCvs9P
         PeQkYYPC8dhl5X8oRD4FIImPh+D41XpO/GQYVPQ1mSNOHaAoZ6NFlUiRiHjHUy/UP9xy
         gNI8EjSFpToF01IwxHyStke0zTosr++S5UYRjSQpyZMsmB+i5Evf2/9Zizd3wCO5lXEU
         Sjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=4hViO3AGp6pToaoN8VF8Iwb+OF6je+qeF4CeyLwe0vY=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=uz5ctBLzUzxKNLUREqY8xPPcx5z0c+hAT1Ubq7C6ETJsTTAQmNfnHUhhhoiGaO1VN4
         vdwmQ1YY+jXZui23o4rcvysA2DrXlqSRnjAjOV17SArHcC+YqPoICSV07RAZHmM0P4FX
         UzpwgSWvkxDbyxQx/L6XDkMEpedUsUcnRpKqQEbbzPL3O/94D7gJvioWEnSIViOXPScQ
         73nsYs0gCzTNcqol8U6YKqZlVwc3p3UJX/wcx8rIaZ6piwjbvTEQwCxr30O4AfqojFO8
         XiY495dlQGsbCwvKMY7RRPIdBO01casyhDLv5NADva1ij651NPKlkcUuxp/IwQw+bVlb
         VfqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id z31-20020a05620a261f00b0077f3c33cf55si608635qko.704.2023.12.07.13.22.36
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:36 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-aMa0JqaOMZCWhTLUeB2SqQ-1; Thu,
 07 Dec 2023 16:22:35 -0500
X-MC-Unique: aMa0JqaOMZCWhTLUeB2SqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 191A229AC00A
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 15B973C32; Thu,  7 Dec 2023 21:22:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 776CB3C2E;
	Thu,  7 Dec 2023 21:22:32 +0000 (UTC)
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
Subject: [PATCH v3 07/59] netfs: Allow the netfs to make the io (sub)request alloc larger
Date: Thu,  7 Dec 2023 21:21:14 +0000
Message-ID: <20231207212206.1379128-8-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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
cc: Jeff Layton <jlayton@kernel.org>
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

