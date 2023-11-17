Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRVQ36VAMGQENIIA3QQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7187EF986
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:55 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-41ea8e21785sf62284081cf.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255814; cv=pass;
        d=google.com; s=arc-20160816;
        b=F81PKC01DgFbQYC07qEsijpopz9hFndiwxs25WnpdcmIFfwtYj6oklEOEhDIEP20W5
         ErE2IfaXoFsAWo+6zPLB6hbwvRJE5gwNNkUltkVm8K/KROhE4PBmDjPv8NYo1Y5OIUDL
         20htliE5fQ1F6Zhw6Dr6z4XOM3JhpMHwi2hClibrIMZZJy+47ISLSQWi5Z4NP9yVvPqL
         XSR5ycO59bWXj6wYX8S6DQvs1uHxZPTyAiF8ymkpFVEfyxN4UWEAjpMkX7biaEOGYcxC
         KY0n4A7xcNcrjto3+KmZz7aR4jckqwC7M63vNZhvvXHCN06fBsXOG50EyWLRkI6TlM9D
         sB8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=H/a4E6C8QgllxT0Yyn6QsmTQayliGD7pMYfTMV9NxPI=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=JmNKTH/fd8nKoFtOaE5fUMVvvJ7b46wm4pfT8AeEk5eDa7DY+/rl/hTk+jOd1B5JX2
         T7cX6Hqm5dc/KrOpLCxCHqS6Tc7T5Q1JXjCKD3WHG61g5sRH98d3ScpJiii8ZipFX7QE
         dKkTAflvgFq5IhC6HXA4iu9R87epJHQZopwTCeXN2BLfM6ER6DnbnQxDlGe36bJ9tlxR
         gmY5MuS5X8u2tKQee/Tjbb4tKrqlanCJKem6u6ZXK2w7xb47rhAEPJ0w0dLYx1xaQeD4
         nzDDK0E6ZiDUw9xWgCti2fT/He5WFT0qij3fEj8OC8+yaYJ5G3x/45n4fp884Sc6cLhC
         HVIQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255814; x=1700860614;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/a4E6C8QgllxT0Yyn6QsmTQayliGD7pMYfTMV9NxPI=;
        b=NQeAQk6ptWB6mfOvdABOjgu+SKv+qEvTMqya0TM4wyGdSp6nsGdm2os84Fwx6tOx1B
         8lufdiw5qVIuT4ju6zuzv8VuqF3JLL+amDzbvuuvKLPhHJEiY+e9OKTj6UtH/Ims7t40
         QB/1zTVR0+PSd/XlQcJpJpRJFwowkB3c3vp4GJEwYx9mLpTM8/T33oXfY7G9vjyy6F8l
         Cx6uftFQSRZ4bD55hjeVgtMvPsTYvk9wJQJApOMzHMBbAM3rtb9f3hYq+jVrTg5/ZRfw
         /XdhnN85g8kbk+FnjLDbieb8Kssen8s3DxbMkbK8TQbFYuDFiy0QWYPiDjIToXu9uiZl
         SDLg==
X-Gm-Message-State: AOJu0YzRwJDua4xyic5qGMZkziai055iLRThhTaZlJMYzUJqrKyMR4p8
	lkOsYk3cTcje/REuyzk7VOXV2w==
X-Google-Smtp-Source: AGHT+IEFw6u+ky7A8a7LQ0P3eK3TYaJKbG6y0WnqZfSMSZF1NL/I0aHZqgEz+EyGl0xGxz+QNOZpzw==
X-Received: by 2002:a05:622a:593:b0:403:b088:5d3 with SMTP id c19-20020a05622a059300b00403b08805d3mr10493978qtb.17.1700255814490;
        Fri, 17 Nov 2023 13:16:54 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7f92:0:b0:41c:d310:a7c2 with SMTP id z18-20020ac87f92000000b0041cd310a7c2ls1415626qtj.2.-pod-prod-00-us;
 Fri, 17 Nov 2023 13:16:54 -0800 (PST)
X-Received: by 2002:a05:620a:14a4:b0:76e:e66c:92f8 with SMTP id x4-20020a05620a14a400b0076ee66c92f8mr531973qkj.8.1700255813803;
        Fri, 17 Nov 2023 13:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255813; cv=none;
        d=google.com; s=arc-20160816;
        b=JaftGmzN76+6mUl+HemlUOWcuXzSnXTpxKr9vEQCYY4xep+F+SONPZhd3nmHsmhqPB
         oPf7M2W0xcTFZKu6Kwcijhq4y+yjJ2cGVfO0o9XRpuya/+v49OAhzWfX7LNlZufElEsb
         mQGtQ4nY1TP1mh1DX01BzhdUNl5E69VtGcPG/6AazqQys7kBTW2NeA8uoZxVpBiX64dl
         7ybz3a8b2YJ4u9/L5FNUUsssA9vg+I9qJHtSMwGl2PIgqNMk8TLvQW8KSA1qC1/YWET8
         oirRpykvWCt4FNgicSgYQtCk6XSd3JWLuv9HbShR5LwAXf/ejt5Y4VB6GSjVWcLEw0Fe
         e1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=fsCXZYi8G6brqu2iwUxtHCsIIj0ZKZC/tTA2dXo92P0=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=xhwHRx3KwkmyP3TCcsF4dufiXjqsS5jTVsB2wa5VVgyEZPiOJAv8I16X4BF1Beg/yP
         D/Vr3CRQO63RvB3uCs3dMFWYJ7gzXGPbK8VFLl6UlOap2JMFWdQvzw3Yx/++kh+yQfKA
         RVMXh2mSyBgPf2SVDedqalgMjC85DMhJZtcowDCslfmvql75Tm2mUSKsgzjFu1I3IMvX
         EktlorhuL2DEfZBvx+EyVSSIsm86UmeyywfDMxRg9K3TFupaywE57RJZ6odwebGFN/sG
         FuKJrMFNVarivoTVBhQWvWEJoLPdaV51n8+C+mMMnrzVY2Jfmmh2RUWMRrRZT6p17kba
         NMqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id u20-20020a05620a0c5400b00775787784bfsi2660393qki.67.2023.11.17.13.16.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-OkvM-w04PLiEOzOAmfD6pg-1; Fri, 17 Nov 2023 16:16:50 -0500
X-MC-Unique: OkvM-w04PLiEOzOAmfD6pg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70798527A5
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E3B03492BE8; Fri, 17 Nov 2023 21:16:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44D6B492BE0;
	Fri, 17 Nov 2023 21:16:47 +0000 (UTC)
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
Subject: [PATCH v2 18/51] fscache: Add a function to begin an cache op from a netfslib request
Date: Fri, 17 Nov 2023 21:15:10 +0000
Message-ID: <20231117211544.1740466-19-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Add a function to begin an cache read or write operation from a netfslib
I/O request.  This function can then be pointed to directly by the network
filesystem's netfs_request_ops::begin_cache_operation op pointer.

Ideally, netfslib would just call into fscache directly, but that would
cause dependency cycles as fscache calls into netfslib directly.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/9p/vfs_addr.c        | 18 ++----------------
 fs/afs/file.c           | 14 +-------------
 fs/ceph/addr.c          |  2 +-
 fs/ceph/cache.h         | 12 ------------
 fs/fscache/io.c         | 42 +++++++++++++++++++++++++++++++++++++++++
 include/linux/fscache.h |  6 ++++++
 6 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 18a666c43e4a..516572bad412 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -17,6 +17,7 @@
 #include <linux/swap.h>
 #include <linux/uio.h>
 #include <linux/netfs.h>
+#include <linux/fscache.h>
 #include <net/9p/9p.h>
 #include <net/9p/client.h>
 
@@ -82,25 +83,10 @@ static void v9fs_free_request(struct netfs_io_request *rreq)
 	p9_fid_put(fid);
 }
 
-/**
- * v9fs_begin_cache_operation - Begin a cache operation for a read
- * @rreq: The read request
- */
-static int v9fs_begin_cache_operation(struct netfs_io_request *rreq)
-{
-#ifdef CONFIG_9P_FSCACHE
-	struct fscache_cookie *cookie = v9fs_inode_cookie(V9FS_I(rreq->inode));
-
-	return fscache_begin_read_operation(&rreq->cache_resources, cookie);
-#else
-	return -ENOBUFS;
-#endif
-}
-
 const struct netfs_request_ops v9fs_req_ops = {
 	.init_request		= v9fs_init_request,
 	.free_request		= v9fs_free_request,
-	.begin_cache_operation	= v9fs_begin_cache_operation,
+	.begin_cache_operation	= fscache_begin_cache_operation,
 	.issue_read		= v9fs_issue_read,
 };
 
diff --git a/fs/afs/file.c b/fs/afs/file.c
index a7658fb2d7dc..490dbccf1710 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -359,18 +359,6 @@ static int afs_init_request(struct netfs_io_request *rreq, struct file *file)
 	return 0;
 }
 
-static int afs_begin_cache_operation(struct netfs_io_request *rreq)
-{
-#ifdef CONFIG_AFS_FSCACHE
-	struct afs_vnode *vnode = AFS_FS_I(rreq->inode);
-
-	return fscache_begin_read_operation(&rreq->cache_resources,
-					    afs_vnode_cache(vnode));
-#else
-	return -ENOBUFS;
-#endif
-}
-
 static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
 				 struct folio **foliop, void **_fsdata)
 {
@@ -387,7 +375,7 @@ static void afs_free_request(struct netfs_io_request *rreq)
 const struct netfs_request_ops afs_req_ops = {
 	.init_request		= afs_init_request,
 	.free_request		= afs_free_request,
-	.begin_cache_operation	= afs_begin_cache_operation,
+	.begin_cache_operation	= fscache_begin_cache_operation,
 	.check_write_begin	= afs_check_write_begin,
 	.issue_read		= afs_issue_read,
 };
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 03feb4dc6352..595bd774f046 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -489,7 +489,7 @@ static void ceph_netfs_free_request(struct netfs_io_request *rreq)
 const struct netfs_request_ops ceph_netfs_ops = {
 	.init_request		= ceph_init_request,
 	.free_request		= ceph_netfs_free_request,
-	.begin_cache_operation	= ceph_begin_cache_operation,
+	.begin_cache_operation	= fscache_begin_cache_operation,
 	.issue_read		= ceph_netfs_issue_read,
 	.expand_readahead	= ceph_netfs_expand_readahead,
 	.clamp_length		= ceph_netfs_clamp_length,
diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
index dc502daac49a..b804f1094764 100644
--- a/fs/ceph/cache.h
+++ b/fs/ceph/cache.h
@@ -57,13 +57,6 @@ static inline int ceph_fscache_dirty_folio(struct address_space *mapping,
 	return fscache_dirty_folio(mapping, folio, ceph_fscache_cookie(ci));
 }
 
-static inline int ceph_begin_cache_operation(struct netfs_io_request *rreq)
-{
-	struct fscache_cookie *cookie = ceph_fscache_cookie(ceph_inode(rreq->inode));
-
-	return fscache_begin_read_operation(&rreq->cache_resources, cookie);
-}
-
 static inline bool ceph_is_cache_enabled(struct inode *inode)
 {
 	return fscache_cookie_enabled(ceph_fscache_cookie(ceph_inode(inode)));
@@ -135,11 +128,6 @@ static inline bool ceph_is_cache_enabled(struct inode *inode)
 	return false;
 }
 
-static inline int ceph_begin_cache_operation(struct netfs_io_request *rreq)
-{
-	return -ENOBUFS;
-}
-
 static inline void ceph_fscache_note_page_release(struct inode *inode)
 {
 }
diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 0d2b8dec8f82..cb602dd651e6 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -158,6 +158,48 @@ int __fscache_begin_write_operation(struct netfs_cache_resources *cres,
 }
 EXPORT_SYMBOL(__fscache_begin_write_operation);
 
+/**
+ * fscache_begin_cache_operation - Begin a cache op for netfslib
+ * @rreq: The netfs request that wants to access the cache.
+ *
+ * Begin an I/O operation on behalf of the netfs helper library, read or write.
+ * @rreq indicates the netfs operation that wishes to access the cache.
+ *
+ * This is intended to be pointed to directly by the ->begin_cache_operation()
+ * netfs lib operation for the network filesystem.
+ *
+ * @cres->inval_counter is set from @cookie->inval_counter for comparison at
+ * the end of the operation.  This allows invalidation during the operation to
+ * be detected by the caller.
+ *
+ * Returns:
+ * * 0		- Success
+ * * -ENOBUFS	- No caching available
+ * * Other error code from the cache, such as -ENOMEM.
+ */
+int fscache_begin_cache_operation(struct netfs_io_request *rreq)
+{
+	struct netfs_inode *ctx = netfs_inode(rreq->inode);
+
+	switch (rreq->origin) {
+	case NETFS_READAHEAD:
+	case NETFS_READPAGE:
+	case NETFS_READ_FOR_WRITE:
+		return fscache_begin_operation(&rreq->cache_resources,
+					       netfs_i_cookie(ctx),
+					       FSCACHE_WANT_PARAMS,
+					       fscache_access_io_read);
+	case NETFS_WRITEBACK:
+		return fscache_begin_operation(&rreq->cache_resources,
+					       netfs_i_cookie(ctx),
+					       FSCACHE_WANT_PARAMS,
+					       fscache_access_io_write);
+	default:
+		return -ENOBUFS;
+	}
+}
+EXPORT_SYMBOL(fscache_begin_cache_operation);
+
 /**
  * fscache_dirty_folio - Mark folio dirty and pin a cache object for writeback
  * @mapping: The mapping the folio belongs to.
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 8e312c8323a8..9c389adaf286 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -177,6 +177,12 @@ extern void __fscache_write_to_cache(struct fscache_cookie *, struct address_spa
 				     bool);
 extern void __fscache_clear_page_bits(struct address_space *, loff_t, size_t);
 
+#if __fscache_available
+extern int fscache_begin_cache_operation(struct netfs_io_request *rreq);
+#else
+#define fscache_begin_cache_operation NULL
+#endif
+
 /**
  * fscache_acquire_volume - Register a volume as desiring caching services
  * @volume_key: An identification string for the volume

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

