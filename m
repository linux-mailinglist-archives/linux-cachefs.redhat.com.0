Return-Path: <linux-cachefs+bncBDLIXLMFVAERBHPQZCVQMGQE2ZPG3DY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id C0799809399
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:48 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58a5860c88fsf1351442eaf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984287; cv=pass;
        d=google.com; s=arc-20160816;
        b=TG6XLtf7hjGt9ojIXBYwFJ3RnKz5Bu+zXXSsdYwLDs3GMyloQCNmeVpYC4oBKcRwSk
         zc0FzYXqeD8xY1YT8dFGO+Woc7iLzm2JkmTawkENwJSET6Brc5troOYHUB9iw3NOSGFi
         XkiCxaVBIWiUVIpV1+VngF7YGMn4yKEnfAcE/cmVnZvU9aQ5co0LXiZmFAJlzc0piuHD
         YApgSNlqMRRhT5T489emAWZoNHxz7IjqkXgV1/p8p4aFoAFiDCxhMTItpSdHvL7a8HJ2
         5yM87+aIHSHj+Qj/y/j7ZXrsGYs0xdqa/wUqm1G9GgFh20xinVUZGaOcpB8MgUF8tokw
         BsAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=MxIaqL08WJE6wH9LlqCxOpqF1LYAAKliB50hw62G3b0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=K3H2j6HJqLuqCJWeNEeVlYnjAAc5HBhjwTAOcenAp2S3Gekw6v4Dh5W6X+LeS19mgK
         ZDAPL/USTWQ20LIPNHQsQIIuqp4uw+rmsYa+xp531273Y1ykZtsActr3Svw373Q8YhJN
         8vqgQESuVF71GwtTx+ZiaSZ2uo792cqY5U4uaNeMFIxi1jAua/S4CxBaefNLlI68hvSv
         VUOYwTdzzoZKud2bnFJw2aZR8is3HT7FAYUyUTYUoWmJ1lOXI8mRGpe8n7pS2XGzoCR5
         qWdpNXDLzaEN37iNgu3owXi69a+GxGIT5wht975TWQ58wNIo23Rp2UtqneNE3xOzoI6h
         xWQA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984287; x=1702589087;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxIaqL08WJE6wH9LlqCxOpqF1LYAAKliB50hw62G3b0=;
        b=QqRm3mfwRL8ZP8Udw1p99kYTGAJjcZE41WyVgIQaIwN+cf24csRsBYqj42prDFvhoe
         ShddwrOy8FO6nZoh3PLAenvnnjxmHD2nX3euoaBUS55SalPHukJC4Rbo7B9QIMSGrcIw
         zmoI8p50ruaUezNCUnnzcaZ61KrK4I8l/VZvq3qDKJE4flfdYSwdH/3E4dBKrf7faAP5
         WbzxVdo0fe4TEgE6BvlvCBRL1tKD2ZFeDOWOzI3OuaxsKhhWvw1GlfnNwEF0GWf7pB+n
         nc4U1xuQo8OAdpt8kfeXceGN2GAZtOB1TBN6HTWaw/rmmOD7M6rKEn9Z8FXlj1JBGibI
         wzqw==
X-Gm-Message-State: AOJu0YxSuVA8+ymhRYo58ASTYGq2w4KO4jsBL0FGxr1hTakpKUqEMH4q
	N0V6ktVOALcLrf5zFqAk4m8KgQ==
X-Google-Smtp-Source: AGHT+IHMr/CqREVb129Mq8fH6N6fKTXYbIP4ivS6M8GxPqzz/Wge5vyBleNPEoeLZk+vWa3BwT+SJQ==
X-Received: by 2002:a4a:3c5c:0:b0:590:6fc4:ffef with SMTP id p28-20020a4a3c5c000000b005906fc4ffefmr1380155oof.11.1701984285435;
        Thu, 07 Dec 2023 13:24:45 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:1b90:b0:58d:be21:9e7c with SMTP id
 cb16-20020a0568201b9000b0058dbe219e7cls1900208oob.1.-pod-prod-03-us; Thu, 07
 Dec 2023 13:24:44 -0800 (PST)
X-Received: by 2002:a05:6830:12c7:b0:6d9:af30:37ae with SMTP id a7-20020a05683012c700b006d9af3037aemr3637736otq.74.1701984284586;
        Thu, 07 Dec 2023 13:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984284; cv=none;
        d=google.com; s=arc-20160816;
        b=yrAQpV88vS3TmF4b4j4u8rjLtlqZy/IfD7dll4oMqWnYt20tyKiLmgVc7ZJJkNxSEb
         aausEYpA/n4+Tdv+YH9Cg9cT/WCinrA45gpYHmrVwT8E/2lPVFeVdasOoJvSfH2RafQ7
         SrjQtVeGfnW+Rd1WCu22bt4P0MtKM83LF7b8jMbCVa1UaFSiYsGAcQFnXOtJYKC37jUV
         yh8MjngBp/pppbe/uKCYfbkjrra/tmw2fI7W9JA3WXMsimvjRxvJXLoJLrKnrklf3RZn
         N1vcIvNzc0FibXDpKdajP8BtZv26rmf/VIrAU86RuHxaY77fxAgZRB5co3iuoUevj2j8
         1CRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=OLRxuYEyNmYWJaAue2cZSyhh27IY81lv9xDi1f+6vNc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=SauWq7yZomxnqfdluOY/t+LPZk/i2aFP3NAkKxDg2AqDhDMzy2PhVqOD2qoWc0MfMv
         ZAa8a0JQgr3qoNnBIaO6c9PWwmY8vq4JnswWZ3Armok6ydxXmNctlv2JUxjYdjM3FIN1
         P1ztGamS938kFxB6T8NzY3FCH72On7iG01akpFlU4a7qmdcXs+uu+FLxkwCNR/QuAgoE
         gFB+GtJCvaUdlqCZoa7DvM/T1MwauBmEb1hueAMtSEUZ+n/WfDnuEAtMTsTGHHs9BvYr
         KwMuZqZ9US82F9BwgkxVfchBnTHdWXXAtD8ir4DNXckx4OwJf5NdBfB/pzHPyHgyKPpi
         OO1w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id gd13-20020a05622a5c0d00b00425626f379fsi705787qtb.805.2023.12.07.13.24.44
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:44 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-Gr2Cq4j6O5OQGzzXIGEcFA-1; Thu,
 07 Dec 2023 16:24:43 -0500
X-MC-Unique: Gr2Cq4j6O5OQGzzXIGEcFA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC80429AC013
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E9CD9492BCF; Thu,  7 Dec 2023 21:24:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DBB8492BC6;
	Thu,  7 Dec 2023 21:24:40 +0000 (UTC)
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
Subject: [PATCH v3 44/59] netfs: Optimise away reads above the point at which there can be no data
Date: Thu,  7 Dec 2023 21:21:51 +0000
Message-ID: <20231207212206.1379128-45-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Track the file position above which the server is not expected to have any
data (the "zero point") and preemptively assume that we can satisfy
requests by filling them with zeroes locally rather than attempting to
download them if they're over that line - even if we've written data back
to the server.  Assume that any data that was written back above that
position is held in the local cache.  Note that we have to split requests
that straddle the line.

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

 (7) If stored data is discarded from the pagecache or culled from fscache,
     we must set zero_point above that if the data also got written to the
     server.

 (8) If dirty data is written back to the server, but not fscache, we must
     set zero_point above that.

 (9) If a direct I/O write is made, set zero_point above that.

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
 fs/afs/inode.c            | 22 +++++++++++++---------
 fs/netfs/buffered_write.c |  2 +-
 fs/netfs/direct_write.c   |  4 ++++
 fs/netfs/io.c             | 10 ++++++++++
 fs/netfs/misc.c           |  5 +++++
 fs/smb/client/cifsfs.c    |  4 ++--
 include/linux/netfs.h     | 14 ++++++++++++--
 7 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 37485ae31471..2b44a342b4a1 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -168,6 +168,7 @@ static void afs_apply_status(struct afs_operation *op,
 	struct inode *inode = &vnode->netfs.inode;
 	struct timespec64 t;
 	umode_t mode;
+	bool unexpected_jump = false;
 	bool data_changed = false;
 	bool change_size = vp->set_size;
 
@@ -231,6 +232,7 @@ static void afs_apply_status(struct afs_operation *op,
 		}
 		change_size = true;
 		data_changed = true;
+		unexpected_jump = true;
 	} else if (vnode->status.type == AFS_FTYPE_DIR) {
 		/* Expected directory change is handled elsewhere so
 		 * that we can locally edit the directory and save on a
@@ -252,6 +254,8 @@ static void afs_apply_status(struct afs_operation *op,
 		vnode->netfs.remote_i_size = status->size;
 		if (change_size || status->size > i_size_read(inode)) {
 			afs_set_i_size(vnode, status->size);
+			if (unexpected_jump)
+				vnode->netfs.zero_point = status->size;
 			inode_set_ctime_to_ts(inode, t);
 			inode_set_atime_to_ts(inode, t);
 		}
@@ -865,17 +869,17 @@ static void afs_setattr_success(struct afs_operation *op)
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
+			truncate_setsize(&vnode->netfs.inode, size);
+			netfs_resize_file(&vnode->netfs, size, true);
+			fscache_resize_cookie(afs_vnode_cache(vnode), size);
+		}
 	}
 }
 
@@ -943,11 +947,11 @@ int afs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		 */
 		if (!(attr->ia_valid & (supported & ~ATTR_SIZE & ~ATTR_MTIME)) &&
 		    attr->ia_size < i_size &&
-		    attr->ia_size > vnode->status.size) {
-			truncate_pagecache(inode, attr->ia_size);
+		    attr->ia_size > vnode->netfs.remote_i_size) {
+			truncate_setsize(inode, attr->ia_size);
+			netfs_resize_file(&vnode->netfs, size, false);
 			fscache_resize_cookie(afs_vnode_cache(vnode),
 					      attr->ia_size);
-			i_size_write(inode, attr->ia_size);
 			ret = 0;
 			goto out_unlock;
 		}
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 461be124b35d..64d84a0544ae 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -73,7 +73,7 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 	if (folio_test_uptodate(folio))
 		return NETFS_FOLIO_IS_UPTODATE;
 
-	if (pos >= ctx->remote_i_size)
+	if (pos >= ctx->zero_point)
 		return NETFS_MODIFY_AND_CLEAR;
 
 	if (!maybe_trouble && offset == 0 && len >= flen)
diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
index 45165a3d5f99..37923dfeaae4 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -334,6 +334,7 @@ ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file->f_mapping->host;
 	struct netfs_inode *ictx = netfs_inode(inode);
+	unsigned long long end;
 	ssize_t ret;
 
 	_enter("%llx,%zx,%llx", iocb->ki_pos, iov_iter_count(from), i_size_read(inode));
@@ -355,6 +356,9 @@ ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	ret = kiocb_invalidate_pages(iocb, iov_iter_count(from));
 	if (ret < 0)
 		goto out;
+	end = iocb->ki_pos + iov_iter_count(from);
+	if (end > ictx->zero_point)
+		ictx->zero_point = end;
 
 	fscache_invalidate(netfs_i_cookie(ictx), NULL, i_size_read(inode),
 			   FSCACHE_INVAL_DIO_WRITE);
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index ae014efe8728..5f112afcf578 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -573,6 +573,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 			struct iov_iter *io_iter)
 {
 	enum netfs_io_source source = NETFS_DOWNLOAD_FROM_SERVER;
+	struct netfs_inode *ictx = netfs_inode(rreq->inode);
 	size_t lsize;
 
 	_enter("%llx-%llx,%llx", subreq->start, subreq->start + subreq->len, rreq->i_size);
@@ -590,6 +591,14 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 		 * to make serial calls, it can indicate a short read and then
 		 * we will call it again.
 		 */
+		if (rreq->origin != NETFS_DIO_READ) {
+			if (subreq->start >= ictx->zero_point) {
+				source = NETFS_FILL_WITH_ZEROES;
+				goto set;
+			}
+			if (subreq->len > ictx->zero_point - subreq->start)
+				subreq->len = ictx->zero_point - subreq->start;
+		}
 		if (subreq->len > rreq->i_size - subreq->start)
 			subreq->len = rreq->i_size - subreq->start;
 		if (rreq->rsize && subreq->len > rreq->rsize)
@@ -611,6 +620,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 		}
 	}
 
+set:
 	if (subreq->len > rreq->len)
 		pr_warn("R=%08x[%u] SREQ>RREQ %zx > %zx\n",
 			rreq->debug_id, subreq->debug_index,
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index 40421ced4cd3..31e45dfad5b0 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -240,6 +240,11 @@ EXPORT_SYMBOL(netfs_invalidate_folio);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp)
 {
 	struct netfs_inode *ctx = netfs_inode(folio_inode(folio));
+	unsigned long long end;
+
+	end = folio_pos(folio) + folio_size(folio);
+	if (end > ctx->zero_point)
+		ctx->zero_point = end;
 
 	if (folio_test_private(folio))
 		return false;
diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 96a65cf9b5ec..07cd88897c33 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -1220,7 +1220,7 @@ static int cifs_precopy_set_eof(struct inode *src_inode, struct cifsInodeInfo *s
 	if (rc < 0)
 		goto set_failed;
 
-	netfs_resize_file(&src_cifsi->netfs, src_end);
+	netfs_resize_file(&src_cifsi->netfs, src_end, true);
 	fscache_resize_cookie(cifs_inode_cookie(src_inode), src_end);
 	return 0;
 
@@ -1351,7 +1351,7 @@ static loff_t cifs_remap_file_range(struct file *src_file, loff_t off,
 			smb_file_src, smb_file_target, off, len, destoff);
 		if (rc == 0 && new_size > i_size_read(target_inode)) {
 			truncate_setsize(target_inode, new_size);
-			netfs_resize_file(&target_cifsi->netfs, new_size);
+			netfs_resize_file(&target_cifsi->netfs, new_size, true);
 			fscache_resize_cookie(cifs_inode_cookie(target_inode),
 					      new_size);
 		}
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 08040da65336..29072b6418c3 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -137,6 +137,8 @@ struct netfs_inode {
 	struct fscache_cookie	*cache;
 #endif
 	loff_t			remote_i_size;	/* Size of the remote file */
+	loff_t			zero_point;	/* Size after which we assume there's no data
+						 * on the server */
 	unsigned long		flags;
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
@@ -482,6 +484,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 {
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(&ctx->inode);
+	ctx->zero_point = ctx->remote_i_size;
 	ctx->flags = 0;
 	ctx->min_bshift = 0;
 	ctx->crypto_bshift = 0;
@@ -489,18 +492,25 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif
+	/* ->releasepage() drives zero_point */
+	mapping_set_release_always(ctx->inode.i_mapping);
 }
 
 /**
  * netfs_resize_file - Note that a file got resized
  * @ctx: The netfs inode being resized
  * @new_i_size: The new file size
+ * @changed_on_server: The change was applied to the server
  *
  * Inform the netfs lib that a file got resized so that it can adjust its state.
  */
-static inline void netfs_resize_file(struct netfs_inode *ctx, loff_t new_i_size)
+static inline void netfs_resize_file(struct netfs_inode *ctx, loff_t new_i_size,
+				     bool changed_on_server)
 {
-	ctx->remote_i_size = new_i_size;
+	if (changed_on_server)
+		ctx->remote_i_size = new_i_size;
+	if (new_i_size < ctx->zero_point)
+		ctx->zero_point = new_i_size;
 }
 
 /**

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

