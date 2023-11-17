Return-Path: <linux-cachefs+bncBDLIXLMFVAERBD5Q36VAMGQEIVQGNFQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E557EF955
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:01 +0100 (CET)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1eb83f1d150sf2215804fac.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255760; cv=pass;
        d=google.com; s=arc-20160816;
        b=CqaO3c7RQ8wFZiz3JdqE6kDWQKCUYLx1oHdZf/NCyoGEbW+100szf0qS7wnXaYuzOg
         AnPQCY3QGJCCnluE7G1jRv9r7o4z84vws9BKY50stpsIuMPUT/QU1O8WyyBX5mBN8P3/
         zqgaT6PyB/TaO66xlofRV8EUyYg+gWh1NUSbXbfqcdn1DIbPxgH71otDGy1Kmqdh5HCg
         jSCoqcsOlvK236rrL3tzAu7m+YMmJx608cnT113E615ww+qsJPvuYy6mwtmyH8EsNcje
         Kfi2zg3osGWzdtl1INbmg4nG8SYt/+CLW/RS5S41He76mM1/ZhmicFcnTbJAB3+5CH8o
         ogjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=MfSSZ6Y7ZpLENbNhNVR2SRFijIAxylLtPPHAKPxGq2I=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=OKGa977GOElSnTnb8HGISbJ97nE0cSxjG+R9WfJK6x4DIGVvie3xitDDSJjOYTNJDS
         HLOzIg2atpMk4514vzQEh9tL/abKy+cCexpxm1818R5p4THVwcLgG7ABW6yhdNRpXJoT
         Bc/icFEYskfVha4BV4R2++WK7iPRQQa4u1XdBbPeMPOi0fpAAKDsWCnOoMrBMtT3BfjU
         XnVlvewm0nWNbgX9x7gcfVbSbtpJ345NOA8QXw1XdYa7fumbXLQeN7Xtxy061UedrKbd
         SqI29VkQt/8mr72PHSfDofx35hp4YLmTk/72r7bknOmb8ZX4KxaiidNSMK1soTbhjPZb
         qXrw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255760; x=1700860560;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfSSZ6Y7ZpLENbNhNVR2SRFijIAxylLtPPHAKPxGq2I=;
        b=u9yHssYUrfbkB2bBNyabBCUC9DuYv25rTi+lcQSxR7Wp7+WoUuWzcpopZ6rIDLmoem
         kjR+GJ3+uO4ELEwFyrzrdA2Q5kAj1uI1BG01PmDDXTAr0RshxJ8/nOISTyr5Sda/VWpP
         cpHiyqkBoztuswPeXdvjKIkjnsXqsIRIaJnrKW9rM8Gk0dFI4OSLlndbWJ8Ah7pQ2lLw
         bQy5tLvZgSnNFnNX6idjLuwsttWbBqYCca758Ev7uYLSIhkIKECb6YFcbKD+EytEunRu
         AiGEu532vUkyz0cov7WtHQVXKxutpQ6CYLHXTfr99q974xUt7UZJ5/QDEKn2Ld5krtAC
         fWMQ==
X-Gm-Message-State: AOJu0YwBYiwFmJVnrvDwy49CVeuVIIG/QTAyTP7eFEk2sUXnPVeEdrZP
	EE5Cx4YGJFY+a7a16KMYHjMIqw==
X-Google-Smtp-Source: AGHT+IFzs/JA2EhQWXqEPhtPnA0Lg5c56mkjwM7fTeY5TxLZvzog9H3Y2ilot5/OoGuV72l+ZLUDqA==
X-Received: by 2002:a05:6870:788b:b0:1ea:4a3c:a597 with SMTP id hc11-20020a056870788b00b001ea4a3ca597mr521787oab.33.1700255760034;
        Fri, 17 Nov 2023 13:16:00 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:1b10:b0:1f5:bf01:d937 with SMTP id
 hl16-20020a0568701b1000b001f5bf01d937ls608541oab.2.-pod-prod-08-us; Fri, 17
 Nov 2023 13:15:59 -0800 (PST)
X-Received: by 2002:a05:6870:ac2c:b0:1d5:a58d:1317 with SMTP id kw44-20020a056870ac2c00b001d5a58d1317mr581883oab.10.1700255759527;
        Fri, 17 Nov 2023 13:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255759; cv=none;
        d=google.com; s=arc-20160816;
        b=kK0XTfov+SzvZJ/S2aNNgoLwtyqaJmQRkR2MTrn6mBNkWPF6ccpu60IGc4+36Kd5lx
         egnYcaEZwMxr1uE5kr5I9GtBRc9bogQ742xaSyGR3/k4q6zV5nMyhu5Sd7nPaPySyB0H
         6AvEPlARAavA/1WXhZTBgMAmSz4Ey5ek8FZdBAj40c+M7KC+f0TVI02ohFarD+FJUrwB
         1l25Rw4ZFXXP7Jod/af6Q3Vinl0ZbE20Tu9U39HsFIuLEWzLFo0qzZbrXqb+mOxvy3q8
         UELSgrKcvJaYkbSDCyFn12D2T9fwLnsnbBOw7R9qdv5I6PZwvjkPN/zjHa9uFmJ/rxxq
         Iwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Dka1EwiXDRUytdRCyJT/oQw9pikuMSUHi7xS1VhzWac=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=Dmv++JN7mxiDrUa1hdcdD+zKRGyML1TeErGV0SL03gg1OZTTfdrxWUws5TtuE8c186
         DOHqfMxz1KzFP5wWcFgb3CHsEBUb9aARTTm7m98cCrYXA0UAdA72/Hy6gZh21VMEFo7G
         Cg7kbtbDAS6VUQXDqhL9SNV0GUEGrJMDGf12T+MzA8ogNmGld9uYC3TlA4wbN6ZMVLtO
         bXJrnuuiAqLStG3OAzk12hMrfR3cOnjO/+3c4kW07OnEy2i5Ky0zFwzWbY/XXcUdIIZZ
         +FCa5Vl0/EAkhSOrfRdEHQvJVeevbYLELVIF2eDEyrMm0GnC+sW48GAwgW/bDme4TkYR
         BvaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id f2-20020ac85d02000000b00419767946aasi2416693qtx.113.2023.11.17.13.15.59
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-MgnJttKxM-q8blpCnOOLrw-1; Fri, 17 Nov 2023 16:15:56 -0500
X-MC-Unique: MgnJttKxM-q8blpCnOOLrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC5F8527A0
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:15:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 29449503A; Fri, 17 Nov 2023 21:15:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 804AD5036;
	Fri, 17 Nov 2023 21:15:53 +0000 (UTC)
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
Subject: [PATCH v2 02/51] netfs: Track the fpos above which the server has no data
Date: Fri, 17 Nov 2023 21:14:54 +0000
Message-ID: <20231117211544.1740466-3-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Track the file position above which the server is not expected to have any
data and preemptively assume that we can simply fill blocks with zeroes
locally rather than attempting to download them - even if we've written
data back to the server.  Assume that any data that was written back above
that position is held in the local cache.  Call this the "zero point".

Make use of this to optimise away some reads from the server.  We need to
set the zero point in the following circumstances:

 (1) When we see an extant remote inode and have no cache for it, we set
     the zero_point to i_size.

 (2) On local inode creation, we set zero_point to 0.

 (3) On local truncation down, we reduce zero_point to the new i_size if
     the new i_size is lower.

 (4) On local truncation up, we don't change zero_point.

 (5) On local modification, we don't change zero_point.

 (6) On remote invalidation, we set zero_point to the new i_size.

 (7) If stored data is culled from fscache, we must set zero_point above
     that if the data also got written to the server.

 (8) If dirty data is written back to the server, but not fscache, we must
     set zero_point above that.

Assuming the above, any read from the server at or above the zero_point
position will return all zeroes.

The zero_point value can be stored in the cache, provided the above rules
are applied to it by any code that culls part of the local cache.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/afs/inode.c           | 13 +++++++------
 fs/netfs/buffered_read.c | 40 +++++++++++++++++++++++++---------------
 include/linux/netfs.h    |  5 +++++
 3 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 78efc9719349..8b4c2ef610ee 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -252,6 +252,7 @@ static void afs_apply_status(struct afs_operation *op,
 		vnode->netfs.remote_i_size = status->size;
 		if (change_size) {
 			afs_set_i_size(vnode, status->size);
+			vnode->netfs.zero_point = status->size;
 			inode_set_ctime_to_ts(inode, t);
 			inode_set_atime_to_ts(inode, t);
 		}
@@ -865,17 +866,17 @@ static void afs_setattr_success(struct afs_operation *op)
 static void afs_setattr_edit_file(struct afs_operation *op)
 {
 	struct afs_vnode_param *vp = &op->file[0];
-	struct inode *inode = &vp->vnode->netfs.inode;
+	struct afs_vnode *vnode = vp->vnode;
 
 	if (op->setattr.attr->ia_valid & ATTR_SIZE) {
 		loff_t size = op->setattr.attr->ia_size;
 		loff_t i_size = op->setattr.old_i_size;
 
-		if (size < i_size)
-			truncate_pagecache(inode, size);
-		if (size != i_size)
-			fscache_resize_cookie(afs_vnode_cache(vp->vnode),
-					      vp->scb.status.size);
+		if (size != i_size) {
+			truncate_pagecache(&vnode->netfs.inode, size);
+			netfs_resize_file(&vnode->netfs, size);
+			fscache_resize_cookie(afs_vnode_cache(vnode), size);
+		}
 	}
 }
 
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 2cd3ccf4c439..a2852fa64ad0 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -147,6 +147,22 @@ static void netfs_rreq_expand(struct netfs_io_request *rreq,
 	}
 }
 
+/*
+ * Begin an operation, and fetch the stored zero point value from the cookie if
+ * available.
+ */
+static int netfs_begin_cache_operation(struct netfs_io_request *rreq,
+				       struct netfs_inode *ctx)
+{
+	int ret = -ENOBUFS;
+
+	if (ctx->ops->begin_cache_operation) {
+		ret = ctx->ops->begin_cache_operation(rreq);
+		/* TODO: Get the zero point value from the cache */
+	}
+	return ret;
+}
+
 /**
  * netfs_readahead - Helper to manage a read request
  * @ractl: The description of the readahead request
@@ -180,11 +196,9 @@ void netfs_readahead(struct readahead_control *ractl)
 	if (IS_ERR(rreq))
 		return;
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto cleanup_free;
-	}
+	ret = netfs_begin_cache_operation(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto cleanup_free;
 
 	netfs_stat(&netfs_n_rh_readahead);
 	trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
@@ -238,11 +252,9 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 		goto alloc_error;
 	}
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto discard;
-	}
+	ret = netfs_begin_cache_operation(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto discard;
 
 	netfs_stat(&netfs_n_rh_readpage);
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
@@ -390,11 +402,9 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	rreq->no_unlock_folio	= folio_index(folio);
 	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
 
-	if (ctx->ops->begin_cache_operation) {
-		ret = ctx->ops->begin_cache_operation(rreq);
-		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
-			goto error_put;
-	}
+	ret = netfs_begin_cache_operation(rreq, ctx);
+	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
+		goto error_put;
 
 	netfs_stat(&netfs_n_rh_write_begin);
 	trace_netfs_read(rreq, pos, len, netfs_read_trace_write_begin);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index b447cb67f599..282511090ead 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -129,6 +129,8 @@ struct netfs_inode {
 	struct fscache_cookie	*cache;
 #endif
 	loff_t			remote_i_size;	/* Size of the remote file */
+	loff_t			zero_point;	/* Size after which we assume there's no data
+						 * on the server */
 };
 
 /*
@@ -330,6 +332,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 {
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(&ctx->inode);
+	ctx->zero_point = ctx->remote_i_size;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif
@@ -345,6 +348,8 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 static inline void netfs_resize_file(struct netfs_inode *ctx, loff_t new_i_size)
 {
 	ctx->remote_i_size = new_i_size;
+	if (new_i_size < ctx->zero_point)
+		ctx->zero_point = new_i_size;
 }
 
 /**

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

