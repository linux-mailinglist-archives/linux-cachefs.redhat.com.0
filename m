Return-Path: <linux-cachefs+bncBDLIXLMFVAERB57PZCVQMGQED27ULFY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64080937F
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:08 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4259c8e6ab7sf331961cf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984248; cv=pass;
        d=google.com; s=arc-20160816;
        b=EJovSu2ldO3X9euOQWaGrpPSzQLI5P03eWbCWRUliCToJ4LgA5csnfUtWeYMv6YUNx
         95Rj5Wdmx2Bb4QTBwmGJD25BpAdcwxB4tTlvkJfA6RN4MkIHJx/waDLf1iyav0pOh7iM
         GgfFTjgZqREaIDxsHn69QHPwtPqADtyDLsHAw/LO5osvdm/RXcTFTedekBdGg98RmjF2
         nEjHz3S0IplO6yDUQjETBnzmwj52S9/MSAzW2qhZH9Lh1P3yyL4w4E30D0ejiUoK3vDq
         Uatf0PQIqSWRUtPZs8O7y/ZD3eOFHC1BkTHlGsU5cHEfJKyNAr5wj9dlanl5pyQPRZCz
         hc2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=d6rWfN60iQDHeSsPn3vOAD+PTmB0MyW7wDXX9DBzjZI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=ayU50gMW7SHJ1VGohD4Bu+B6ErG+8gQWTBcC5+ZuRvNA1JKdBHAYDqv1gYWvOS4085
         Jo7v/te9IyCucMW5FngYfiPvhU/xwIohebUKjSZVgEERCNjwljWdqpU6bG9/tIcHjwGy
         ezH0n2HFGGiBF8/0ZxpfxAiF2U8XFPUCovZcR4dYCQdv9AO1sIB8qgHoATcFWEeEaxiS
         khUEbR2wyGa7Vwuis2wTzPAbpWg4+jCswa0MepK0xTHn0ZmsBMqMLI1SmezYs5eXQyg6
         tjJh4vAjg4yhsY+bXPSwphqPUt9yEvfcTjbU/ImNVx9RxxvR9EMy4Xa42AoPU3nUxZc3
         6LUQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984248; x=1702589048;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6rWfN60iQDHeSsPn3vOAD+PTmB0MyW7wDXX9DBzjZI=;
        b=B0Mv5IKjmoMLHIwHJ5AXLU63SIli/MKrtX65oO05qgHruGHLyqpBIahDYX1/Q80z+5
         bFoDYjUFgWdjvE9IVXDVSxIxCjVcajz/jTJR0fdnm7xGyyukgopeHeFVZxHG2wMiNOFC
         P0f3anvL/FFM7YXQKC1YItujnO1ngFhFWRRJirDU4tK5pm3eLGU6zWhW3HX/tOl+yLPM
         Sc8W0ADYos4c97VVQoxKmzskUGjBrD62S6bVDo62z3KltGkIv6qUtMLJdJIcpKxtMm2b
         gruYcoQji/SVlVycCx2EFjHybIJ9I2h9qG0238iD1ixSAMdPMGXTsbWTtoW/slR6/7wR
         0DkA==
X-Gm-Message-State: AOJu0YzEhxu2dAT89jKV4fo7xxJzaZPWJ/VIPaca4BSABXZo6gxD3zlj
	bF20v7z7D8zgpNWY29Trmlj3VA==
X-Google-Smtp-Source: AGHT+IH/XdqCIBIwAxB/Gg1L+6tZ3LVF64t+Clh8ROybzKMZT2dhrB0Lh6b/ZEQLi4raNxq5bWC52Q==
X-Received: by 2002:a05:622a:130a:b0:423:dbbc:aab7 with SMTP id v10-20020a05622a130a00b00423dbbcaab7mr6731579qtk.1.1701984247890;
        Thu, 07 Dec 2023 13:24:07 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:41c:d096:577c with SMTP id
 a17-20020a05622a065100b0041cd096577cls1510817qtb.2.-pod-prod-07-us; Thu, 07
 Dec 2023 13:24:07 -0800 (PST)
X-Received: by 2002:a05:622a:151:b0:425:9b8f:15b9 with SMTP id v17-20020a05622a015100b004259b8f15b9mr442886qtw.41.1701984247247;
        Thu, 07 Dec 2023 13:24:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984247; cv=none;
        d=google.com; s=arc-20160816;
        b=Wm192hOB7EZle/AQW8O1UZGVpR20zvnfUX4tbYtgeAcz2gAoS/MnM6ouiXaZSj3Dyn
         s8h6t2yTZwgZyThovk24Xeq6LvINb8Kh85DQpYcmXifwTveWW0Fl41aYljX1vc4DHo8C
         QR2ny0hf846r83OGiVnPsmvTyW/6Yzm+4K3BSJlbKiYdlAc1jrARhHkTVNuXZuzCOy7K
         K6sqO6KZzklVZFyHE3UXpky1PNfffYrasFmQ9ipnkIVuP9klL/nyX+DqzL74MlEao+9d
         ktZfoeGRC3Ybo2JjjSDzWL/1Ev0hyjGF8b/FU40tCZ1c/sTqdZtVquDuEZC6fO2ugFCA
         HDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=GWz3UetJ1H2inkDCEy0FPsiHj6M0nuo6NxktZOcXvKA=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=BfzbIQcivl5+Gq7fz9faEsU/8RMgV7h1u1yFeBvzmqPcjX8Mt4HGHxPrQWWnqzILuZ
         egXFDn3AIa5EuGgL1NNsJwC74jSDk72UjBWH/tVisvQf6i8yAa4x++l1Vz4R+dWUqe5f
         HGO7G1FKGeD0jaeCFmSPOmcHu1kNQaaLEhoCAjCP4ZYI2pM/r6wKucmv3toT0D9TSqna
         QLNxsxuBhZGtPhJd3Rt2JLQ/BgxyaPALXnyS362BM4f4kTFLT+Hc0Tdd6cLfQ4k4du5B
         UR44wNQXgVTpiSYBFV/VF37HScayhlMp6cP6nnmDdYcXoZoX4AGNwH+Nx92D14buPM81
         iBiw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id ey23-20020a05622a4c1700b00423b6a1208asi759984qtb.8.2023.12.07.13.24.07
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:07 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-p5Nl0UrZM1WkTVkVaBmHkA-1; Thu,
 07 Dec 2023 16:24:05 -0500
X-MC-Unique: p5Nl0UrZM1WkTVkVaBmHkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B5723C40B55
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 87A483C35; Thu,  7 Dec 2023 21:24:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D986B3C2E;
	Thu,  7 Dec 2023 21:24:02 +0000 (UTC)
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
Subject: [PATCH v3 33/59] netfs, cachefiles: Pass upper bound length to allow expansion
Date: Thu,  7 Dec 2023 21:21:40 +0000
Message-ID: <20231207212206.1379128-34-dhowells@redhat.com>
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

Make netfslib pass the maximum length to the ->prepare_write() op to tell
the cache how much it can expand the length of a write to.  This allows a
write to the server at the end of a file to be limited to a few bytes
whilst writing an entire block to the cache (something required by direct
I/O).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/cachefiles/internal.h |  2 +-
 fs/cachefiles/io.c       | 10 ++++++----
 fs/cachefiles/ondemand.c |  2 +-
 fs/netfs/fscache_io.c    |  2 +-
 fs/netfs/io.c            |  2 +-
 fs/netfs/objects.c       |  1 +
 fs/netfs/output.c        | 25 ++++++++++---------------
 fs/smb/client/fscache.c  |  2 +-
 include/linux/netfs.h    |  5 +++--
 9 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 4a87c9d714a9..d33169f0018b 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -246,7 +246,7 @@ extern bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
 				       enum fscache_want_state want_state);
 extern int __cachefiles_prepare_write(struct cachefiles_object *object,
 				      struct file *file,
-				      loff_t *_start, size_t *_len,
+				      loff_t *_start, size_t *_len, size_t upper_len,
 				      bool no_space_allocated_yet);
 extern int __cachefiles_write(struct cachefiles_object *object,
 			      struct file *file,
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 5857241c5918..9fe69a60eb24 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -517,7 +517,7 @@ cachefiles_prepare_ondemand_read(struct netfs_cache_resources *cres,
  */
 int __cachefiles_prepare_write(struct cachefiles_object *object,
 			       struct file *file,
-			       loff_t *_start, size_t *_len,
+			       loff_t *_start, size_t *_len, size_t upper_len,
 			       bool no_space_allocated_yet)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
@@ -529,6 +529,8 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 	down = start - round_down(start, PAGE_SIZE);
 	*_start = start - down;
 	*_len = round_up(down + len, PAGE_SIZE);
+	if (down < start || *_len > upper_len)
+		return -ENOBUFS;
 
 	/* We need to work out whether there's sufficient disk space to perform
 	 * the write - but we can skip that check if we have space already
@@ -591,8 +593,8 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 }
 
 static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
-				    loff_t *_start, size_t *_len, loff_t i_size,
-				    bool no_space_allocated_yet)
+				    loff_t *_start, size_t *_len, size_t upper_len,
+				    loff_t i_size, bool no_space_allocated_yet)
 {
 	struct cachefiles_object *object = cachefiles_cres_object(cres);
 	struct cachefiles_cache *cache = object->volume->cache;
@@ -608,7 +610,7 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 
 	cachefiles_begin_secure(cache, &saved_cred);
 	ret = __cachefiles_prepare_write(object, cachefiles_cres_file(cres),
-					 _start, _len,
+					 _start, _len, upper_len,
 					 no_space_allocated_yet);
 	cachefiles_end_secure(cache, saved_cred);
 	return ret;
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index b8fbbb1961bb..5fd74ec60bef 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -50,7 +50,7 @@ static ssize_t cachefiles_ondemand_fd_write_iter(struct kiocb *kiocb,
 		return -ENOBUFS;
 
 	cachefiles_begin_secure(cache, &saved_cred);
-	ret = __cachefiles_prepare_write(object, file, &pos, &len, true);
+	ret = __cachefiles_prepare_write(object, file, &pos, &len, len, true);
 	cachefiles_end_secure(cache, saved_cred);
 	if (ret < 0)
 		return ret;
diff --git a/fs/netfs/fscache_io.c b/fs/netfs/fscache_io.c
index 79171a687930..ad572f7ee897 100644
--- a/fs/netfs/fscache_io.c
+++ b/fs/netfs/fscache_io.c
@@ -237,7 +237,7 @@ void __fscache_write_to_cache(struct fscache_cookie *cookie,
 				    fscache_access_io_write) < 0)
 		goto abandon_free;
 
-	ret = cres->ops->prepare_write(cres, &start, &len, i_size, false);
+	ret = cres->ops->prepare_write(cres, &start, &len, len, i_size, false);
 	if (ret < 0)
 		goto abandon_end;
 
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 894c3305710d..5d9098db815a 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -199,7 +199,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
 		}
 
 		ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
-					       rreq->i_size, true);
+					       subreq->len, rreq->i_size, true);
 		if (ret < 0) {
 			trace_netfs_failure(rreq, subreq, ret, netfs_fail_prepare_write);
 			trace_netfs_sreq(subreq, netfs_sreq_trace_write_skip);
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index c1218b183197..16252cc4576e 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -33,6 +33,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 
 	rreq->start	= start;
 	rreq->len	= len;
+	rreq->upper_len	= len;
 	rreq->origin	= origin;
 	rreq->netfs_ops	= ctx->ops;
 	rreq->mapping	= mapping;
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index 560cbcea0c0a..cc9065733b42 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -280,7 +280,7 @@ EXPORT_SYMBOL(netfs_queue_write_request);
  */
 static void netfs_set_up_write_to_cache(struct netfs_io_request *wreq)
 {
-	struct netfs_cache_resources *cres;
+	struct netfs_cache_resources *cres = &wreq->cache_resources;
 	struct netfs_io_subrequest *subreq;
 	struct netfs_inode *ctx = netfs_inode(wreq->inode);
 	struct fscache_cookie *cookie = netfs_i_cookie(ctx);
@@ -294,26 +294,21 @@ static void netfs_set_up_write_to_cache(struct netfs_io_request *wreq)
 	}
 
 	_debug("write to cache");
-	subreq = netfs_create_write_request(wreq, NETFS_WRITE_TO_CACHE, start, len,
-					    netfs_write_to_cache_op_worker);
-	if (!subreq)
+	ret = fscache_begin_write_operation(cres, cookie);
+	if (ret < 0)
 		return;
 
-	cres = &wreq->cache_resources;
-	ret = fscache_begin_read_operation(cres, cookie);
-	if (ret < 0) {
-		netfs_write_subrequest_terminated(subreq, ret, false);
+	ret = cres->ops->prepare_write(cres, &start, &len, wreq->upper_len,
+				       i_size_read(wreq->inode), true);
+	if (ret < 0)
 		return;
-	}
 
-	ret = cres->ops->prepare_write(cres, &start, &len, i_size_read(wreq->inode),
-				       true);
-	if (ret < 0) {
-		netfs_write_subrequest_terminated(subreq, ret, false);
+	subreq = netfs_create_write_request(wreq, NETFS_WRITE_TO_CACHE, start, len,
+					    netfs_write_to_cache_op_worker);
+	if (!subreq)
 		return;
-	}
 
-	netfs_queue_write_request(subreq);
+	netfs_write_to_cache_op(subreq);
 }
 
 /*
diff --git a/fs/smb/client/fscache.c b/fs/smb/client/fscache.c
index e5cad149f5a2..c4a3cb736881 100644
--- a/fs/smb/client/fscache.c
+++ b/fs/smb/client/fscache.c
@@ -180,7 +180,7 @@ static int fscache_fallback_write_pages(struct inode *inode, loff_t start, size_
 	if (ret < 0)
 		return ret;
 
-	ret = cres.ops->prepare_write(&cres, &start, &len, i_size_read(inode),
+	ret = cres.ops->prepare_write(&cres, &start, &len, len, i_size_read(inode),
 				      no_space_allocated_yet);
 	if (ret == 0)
 		ret = fscache_write(&cres, start, &iter, NULL, NULL);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 638f42fdaef5..f98deef22d06 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -263,6 +263,7 @@ struct netfs_io_request {
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */
 	size_t			len;		/* Length of the request */
+	size_t			upper_len;	/* Length can be extended to here */
 	size_t			transferred;	/* Amount to be indicated as transferred */
 	short			error;		/* 0 or error that occurred */
 	enum netfs_io_origin	origin;		/* Origin of the request */
@@ -360,8 +361,8 @@ struct netfs_cache_ops {
 	 * actually do.
 	 */
 	int (*prepare_write)(struct netfs_cache_resources *cres,
-			     loff_t *_start, size_t *_len, loff_t i_size,
-			     bool no_space_allocated_yet);
+			     loff_t *_start, size_t *_len, size_t upper_len,
+			     loff_t i_size, bool no_space_allocated_yet);
 
 	/* Prepare an on-demand read operation, shortening it to a cached/uncached
 	 * boundary as appropriate.

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

