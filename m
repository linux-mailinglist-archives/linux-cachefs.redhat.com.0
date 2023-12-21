Return-Path: <linux-cachefs+bncBDLIXLMFVAERB5PZSCWAMGQE5MQO7FA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id A767381B77F
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:26:14 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4279f0edabasf5207451cf.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:26:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165173; cv=pass;
        d=google.com; s=arc-20160816;
        b=DShOcEBDpdjTSKBCGoWyXRu1YvQehWg3ypX4fURevfLhqD+VqwnLOZqW7bmXN/MWwL
         7b4RmejagJ1yWkb0nycHK2qGp2p3DKxt/E/xPWOAPlU4KIi+5iCFnojPvAL3WDgqTV/u
         Nn6pvJBWQl6qVVMRJpSIMSA2cQNz1cptZz7JfM2NNgQQcWsXTI89QUIyK5cstnWiAUNc
         1oCbRk0ZsMA554i+imAududh+JvmrqvHuN0TGQ2Ousgl+5zCTKTk1Hm6BkiqqurNaFpx
         4Z5gHeBiBpuc446+HOw/EFUbK3FguUG+KOFfyOaTpCS/PPcVYcqVEG6jyIABlb1JuEBL
         GsYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=+XsNmKYpAEJESmFmvg/mxHpPtrb/c9veWrF9/Mk/JIw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=uXqLeFqZMAM2ockb6juxWqT36ci4QA0un1HTSLct5LL5np0vo6fmiKA+bKA1BnDquq
         YTiOYdR/h6G16LVlkKsCLSTZoXW5K7HrkMVQLDMK9MX8lkgwjugwBC4T7nKKloPalPyC
         NYuF0eXykTTjK3k13M52mxhOx8+Dy45Df4nLWln+uKW7FACB1GMiiP+MLXgpcIE/1iPE
         iB5YSnodV44+Z8yfs/bgIpN+Cq/wEc8CV/xcNsmh2b2rDuXWBkh+21N9PRKwJZ8pFPjm
         cGNkNXsrHibrp1M7XRTKRJHejp5G9qMr9hgnvefUfu2jEegQd98/ZQ8u3FdKawnNXFuM
         ML0g==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165173; x=1703769973;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XsNmKYpAEJESmFmvg/mxHpPtrb/c9veWrF9/Mk/JIw=;
        b=pFZNIJRiDRD/3XgegiQ283LJKBgqIgTHC47XELY+NsOwU/Wmy3a/9oUbYx4UEwsfC/
         Vh4XhsGXAUMwHws4jylrXCV02pN3+eYH+W4gtr+BGNcmCPHt1eYlpOKl1quITJykIlF7
         s4/JTx3BYe0m6lN7rX8tZxw/uvgmnCyMKIZDZNq0gh7d9xdspj3aK2/HMKOZY2NpeYyM
         uKU4rlLLyi6x3SrHT2bfpoo93YluTFkKISg49xF+zG8cV3wLorTaiFnqcrfbDVa97Okg
         SHioQhGTKkqnFZ3liQjDOqsKa9eD2vaiGVi/nFxv5s824tjTwABBXXq95TT+i2Pr77eO
         a+Pg==
X-Gm-Message-State: AOJu0YzgS0tiBAmsmLCXOPwy3l5nPRycUFgZSAduk+qS8dX4l/hywp9+
	mmmxy7jHiReTlUCGbnxvowjeUg==
X-Google-Smtp-Source: AGHT+IEvLiFY5RxDpynWZyr/4/bp9z8/5Frj5Wd9jIk9Msmf8epxn5TTuKS+wp4Djz8FpGDp3cAl6Q==
X-Received: by 2002:a0c:c582:0:b0:67a:a721:9eab with SMTP id a2-20020a0cc582000000b0067aa7219eabmr18805250qvj.92.1703165173631;
        Thu, 21 Dec 2023 05:26:13 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:4113:b0:67f:4e7a:d81e with SMTP id
 kc19-20020a056214411300b0067f4e7ad81els1115217qvb.2.-pod-prod-03-us; Thu, 21
 Dec 2023 05:26:13 -0800 (PST)
X-Received: by 2002:ae9:f30f:0:b0:77e:fba3:757e with SMTP id p15-20020ae9f30f000000b0077efba3757emr20253813qkg.118.1703165172895;
        Thu, 21 Dec 2023 05:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165172; cv=none;
        d=google.com; s=arc-20160816;
        b=Lkj/jYBdQMyf3IOznM+Dd4oEeaLCcsSRHpxV+UU/MN/We/G6gpJl+ff3msiQLC7Usk
         lnKfltUmmpxIqWULslXxTAQGbL12bxehQv/wGvRKUESTfU191wLgO7iv2Xj7rjBD9CXd
         aFx0NH0a4wnDcpBjEFx3C7dGIGCgotrSVOGztWbEUXtZ4vS/u84S4/2nwek3ZV9q/1tF
         Yrn0xU8HZm6Glj13Dq3l5uWLFH5GiiR7v1AlQnQjyYUsfE/Lyt+5vLgE3vTp4NKEE4C7
         phTG5MVRDVfd/8KOwkoWOw7hg6OQAkMtgsZNlScYQ16WBlZTEVY7RaVcNDFf8dt2ph4V
         1T1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ewpCLWSgl3LvpkFjSwrnEn/5VMPhz2x5OBI/PxdRkZg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=R7B/AsVJ7ZrjfKbPT6Ju/Tugcmznx9BaGqom+KIgWJhWwklsvlV2Ld7pv7+yMoEv12
         SCwKCi9v2W0GPpP9sm5idGvsMxayklZ2MkOY1Y2XUxea67VdMcL4icXvkQMxhwe24UxC
         D9/WC7hyQWTaj0SOgLN0mf49iXsWT7YqAKaq+Y2Rr/WHtwajvHSuETuUSbeWoVMRuglg
         DmLoSk0MvCp2tCPLSMNGwB9h0oqeVt9nFBimlzLE14GBUQKbb7ShP8RXsx3Hbzqbwecm
         ROhS9XqvXcmmBlYZYR3cZ2PyDJ3zkifbBUcEXnhMkjI373GQoOfvSoAcTyZVM4J3xUnz
         SqBA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id a20-20020a05620a439400b00780e42c417esi2423165qkp.737.2023.12.21.05.26.12
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-6pXpQ_8WNaGGV1SzeYfStw-1; Thu, 21 Dec 2023 08:26:11 -0500
X-MC-Unique: 6pXpQ_8WNaGGV1SzeYfStw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38342868A01
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:26:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 31E0A2027042; Thu, 21 Dec 2023 13:26:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46D122026D66;
	Thu, 21 Dec 2023 13:26:08 +0000 (UTC)
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
Subject: [PATCH v5 33/40] netfs, cachefiles: Pass upper bound length to allow expansion
Date: Thu, 21 Dec 2023 13:23:28 +0000
Message-ID: <20231221132400.1601991-34-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

Make netfslib pass the maximum length to the ->prepare_write() op to tell
the cache how much it can expand the length of a write to.  This allows a
write to the server at the end of a file to be limited to a few bytes
whilst writing an entire block to the cache (something required by direct
I/O).

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
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
index 2ad58c465208..1af48d576a34 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -233,7 +233,7 @@ extern bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
 				       enum fscache_want_state want_state);
 extern int __cachefiles_prepare_write(struct cachefiles_object *object,
 				      struct file *file,
-				      loff_t *_start, size_t *_len,
+				      loff_t *_start, size_t *_len, size_t upper_len,
 				      bool no_space_allocated_yet);
 extern int __cachefiles_write(struct cachefiles_object *object,
 			      struct file *file,
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 009d23cd435b..bffffedce4a9 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -518,7 +518,7 @@ cachefiles_prepare_ondemand_read(struct netfs_cache_resources *cres,
  */
 int __cachefiles_prepare_write(struct cachefiles_object *object,
 			       struct file *file,
-			       loff_t *_start, size_t *_len,
+			       loff_t *_start, size_t *_len, size_t upper_len,
 			       bool no_space_allocated_yet)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
@@ -530,6 +530,8 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 	down = start - round_down(start, PAGE_SIZE);
 	*_start = start - down;
 	*_len = round_up(down + len, PAGE_SIZE);
+	if (down < start || *_len > upper_len)
+		return -ENOBUFS;
 
 	/* We need to work out whether there's sufficient disk space to perform
 	 * the write - but we can skip that check if we have space already
@@ -592,8 +594,8 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 }
 
 static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
-				    loff_t *_start, size_t *_len, loff_t i_size,
-				    bool no_space_allocated_yet)
+				    loff_t *_start, size_t *_len, size_t upper_len,
+				    loff_t i_size, bool no_space_allocated_yet)
 {
 	struct cachefiles_object *object = cachefiles_cres_object(cres);
 	struct cachefiles_cache *cache = object->volume->cache;
@@ -609,7 +611,7 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 
 	cachefiles_begin_secure(cache, &saved_cred);
 	ret = __cachefiles_prepare_write(object, cachefiles_cres_file(cres),
-					 _start, _len,
+					 _start, _len, upper_len,
 					 no_space_allocated_yet);
 	cachefiles_end_secure(cache, saved_cred);
 	return ret;
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 0254ed39f68c..9301d1eb0504 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -52,7 +52,7 @@ static ssize_t cachefiles_ondemand_fd_write_iter(struct kiocb *kiocb,
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
index 01c7ff27228e..14c18be5aca0 100644
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
index 93f1d7431199..b4e3bd836e5d 100644
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
index a2e53ab06a1b..506c543f6888 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -262,6 +262,7 @@ struct netfs_io_request {
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */
 	size_t			len;		/* Length of the request */
+	size_t			upper_len;	/* Length can be extended to here */
 	size_t			transferred;	/* Amount to be indicated as transferred */
 	short			error;		/* 0 or error that occurred */
 	enum netfs_io_origin	origin;		/* Origin of the request */
@@ -358,8 +359,8 @@ struct netfs_cache_ops {
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

