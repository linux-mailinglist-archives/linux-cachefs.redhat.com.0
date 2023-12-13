Return-Path: <linux-cachefs+bncBDLIXLMFVAERBNU246VQMGQEFCCIGGI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E34081167B
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:26:47 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-58d53348a03sf8527487eaf.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:26:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481206; cv=pass;
        d=google.com; s=arc-20160816;
        b=g0jJoLqIEIcv434ecELwcsw5DOSDFkYX3ecdlEk6d0C2VXm+QxPRrCkVA2kZn98qtb
         0E9vCtNxpOBWu+kT7NAp5+3hx7od7YVdJxXIjQUrOAkTrWouf2uZI8xaaqSzU1Oq5pJk
         F0/fgYWtdGSqElh5MEhV4pnDkq9OvjLY7aRpoGB0dDXtjEsG6Tpe3LS8wBut15R/u8VE
         vXXzyIe9YcaPiGuh7daHUtUexWo+d7rF03XtXK4UoeWkGcrnrFoB0pRlZ0VxvQq05Q9j
         /Vq+S8LYFh5Fb2dOW52wjHTPmwSkJVbwcJ5AItqeIyBtLIgzZYW385s/CXz/u/jEHMTS
         NZ0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=yE3ACjEefQh1L/AKS0/QPb0dIhqeQW3ns5E9ZgOL89k=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=uUD9jg/7dLrLyU48wPSJy4mMpmT2xznvRMW5FfYkCJOeOKUmJyJbw8bzomslNGTkDG
         UWXe/azorEn2WHuOgopjI4QmCD08DybhV4V9JF4eN8A0oK0P6ABsHk16+RjPuzVbVtr4
         ApOJcasjz/9cEL3Nz3YaPoXdpvY4P9Pr9FZZy6+cg5aFQVrGwsY0k2vs9J5NEnrl2C4h
         qDeiq2b/YIz6atO8zA0KoHd9Ndo9jCBXfttMayCFp7LTgDeFRV9K2VIwD+za+ai33Zyt
         3NmLFtwseTjopwBwQeKhtO1hwgcojAHiaZLJ7UuoyOnUkxgDZcwNBnj/+zay3HJcuAUN
         BKsQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481206; x=1703086006;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE3ACjEefQh1L/AKS0/QPb0dIhqeQW3ns5E9ZgOL89k=;
        b=Bs3U451SBuifA4cBC84xQbR62oPsgixSQEBNYNb7sMvRZmHvcJkAdArqFAVhCYaJgN
         Ni96dqGzk7E6abtU7Ezynvvbfi8eW8f8XkCTj6YBEn/EFbyOYI96iuD/J5EVcCuXJNAx
         6/rluGj9MwNIII766BFhdq8K6Lpa5S9fr5E+w4NelGn3GvzDqRMCvFIc7vyjC0UleDr1
         nGznIbmOdsf+CTMg0BzUQnPPGfhcAyg/PqvtV0/mtJG3N0ZshRPlroiQGSEOdUGnWBwo
         ZndMstif22gn3HZ0/cTG92AHHU8BUSQh0e7vdD0woXhjt+/YdTxbE3Shl1FgikagiJ3V
         OR+g==
X-Gm-Message-State: AOJu0Yyd8xum367C8LoyHrmmmSpqtoj21yr7hqSrC/QYlE9e8630PDyS
	EoOSZjBEPOLw1AHr4qrG4Hc0ZQ==
X-Google-Smtp-Source: AGHT+IEhdzXLRQgyVHRuutyVTb01Vd9/R4HWmRzNdbCOKJw8yDyCw4T8WJHIfrre1t1X8axff5CHvg==
X-Received: by 2002:a05:6820:162c:b0:590:89d0:9674 with SMTP id bb44-20020a056820162c00b0059089d09674mr5918608oob.3.1702481206178;
        Wed, 13 Dec 2023 07:26:46 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:602:b0:58d:7468:f975 with SMTP id
 e2-20020a056820060200b0058d7468f975ls2218503oow.0.-pod-prod-03-us; Wed, 13
 Dec 2023 07:26:45 -0800 (PST)
X-Received: by 2002:a05:6808:640f:b0:3b9:f059:f5e3 with SMTP id fg15-20020a056808640f00b003b9f059f5e3mr9106802oib.40.1702481205500;
        Wed, 13 Dec 2023 07:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481205; cv=none;
        d=google.com; s=arc-20160816;
        b=TAoDNOR2Z1GjcJG0h8G+qtX4GOE4ZYCSbQWAbG0WO6dS90e9PR6+VBM9+JwlsK+Mlp
         DPnVOgtEqKfjMnX1s1oU1Rtlhl6cQJzVIB6q+ap/hpuAgZxxdqZ5YWPJ5lPRjoXVOqvH
         ufv5caYyJ88hSW+PfQwYwD8aOQz6Ktku8+oNOyS7AdrhAdy+ilNeo9syTiM7G/mNC4+Z
         QzncPY2JMYcQKSmqWv/iN6AxvaFZk6owmPqd+OCoCu2Dr389yQPuleTtmRkJpdry259x
         dnXAG6I33Ij73eu670Z+J24glc4hrzvPt8CpYfgbajVxlwpniPYiXJYij/PUNuxsScGD
         3mNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/Ab7pD2nMsmL/2vj0tSsGNun7wyGJFCz58dAavqg0G8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=lw2WPbvxjL8LZB3gp6qqLEYame3HHtREAJZaNzk4MeI1OiXQiHY9sTQytB8D+2LKe+
         2w47hZJsLYJHXNPBlg0o/LqyqXEhq/MbX0+57UnL+qqfXSxBR6aD2Z0oDE+0livEGenh
         dL6lM79DhHv6WlnsSQLKAnyykLXlyBJ1jciGQ1qU7LgnkugeKgmImof4KCObBPYXyrce
         BAZIhywLxqKJpa6Sbe6WVaSKKpR1chLE2Zz49+OM0rlvMypnqg8R/7yLIz06tfoeBCwZ
         txtVzPAFQvtxaGsmzSH8CHBxj//8Ti3Co1x2BFxq/lC5JeWCPuKhWL049stBkwuAs+Zg
         O9WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id h5-20020ac81385000000b00423786b1582si12187915qtj.328.2023.12.13.07.26.45
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:26:45 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-sYxb_kdnMra47yZPJGqq-A-1; Wed,
 13 Dec 2023 10:26:43 -0500
X-MC-Unique: sYxb_kdnMra47yZPJGqq-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73DD31C18CC9
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:26:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7054D40C6EBA; Wed, 13 Dec 2023 15:26:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6C3140C6EB9;
	Wed, 13 Dec 2023 15:26:39 +0000 (UTC)
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
Subject: [PATCH v4 37/39] netfs: Optimise away reads above the point at which there can be no data
Date: Wed, 13 Dec 2023 15:23:47 +0000
Message-ID: <20231213152350.431591-38-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
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
index c43112dcbbbb..dfd940a64e0f 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -166,6 +166,7 @@ static void afs_apply_status(struct afs_operation *op,
 	struct inode *inode = &vnode->netfs.inode;
 	struct timespec64 t;
 	umode_t mode;
+	bool unexpected_jump = false;
 	bool data_changed = false;
 	bool change_size = vp->set_size;
 
@@ -230,6 +231,7 @@ static void afs_apply_status(struct afs_operation *op,
 		}
 		change_size = true;
 		data_changed = true;
+		unexpected_jump = true;
 	} else if (vnode->status.type == AFS_FTYPE_DIR) {
 		/* Expected directory change is handled elsewhere so
 		 * that we can locally edit the directory and save on a
@@ -251,6 +253,8 @@ static void afs_apply_status(struct afs_operation *op,
 		vnode->netfs.remote_i_size = status->size;
 		if (change_size || status->size > i_size_read(inode)) {
 			afs_set_i_size(vnode, status->size);
+			if (unexpected_jump)
+				vnode->netfs.zero_point = status->size;
 			inode_set_ctime_to_ts(inode, t);
 			inode_set_atime_to_ts(inode, t);
 		}
@@ -689,17 +693,17 @@ static void afs_setattr_success(struct afs_operation *op)
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
 
@@ -767,11 +771,11 @@ int afs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
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
index dce6995fb644..d7ce424b9188 100644
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
index bb0c2718f57b..aad05f2349a4 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -134,6 +134,7 @@ ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file->f_mapping->host;
 	struct netfs_inode *ictx = netfs_inode(inode);
+	unsigned long long end;
 	ssize_t ret;
 
 	_enter("%llx,%zx,%llx", iocb->ki_pos, iov_iter_count(from), i_size_read(inode));
@@ -155,6 +156,9 @@ ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	ret = kiocb_invalidate_pages(iocb, iov_iter_count(from));
 	if (ret < 0)
 		goto out;
+	end = iocb->ki_pos + iov_iter_count(from);
+	if (end > ictx->zero_point)
+		ictx->zero_point = end;
 
 	fscache_invalidate(netfs_i_cookie(ictx), NULL, i_size_read(inode),
 			   FSCACHE_INVAL_DIO_WRITE);
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 5d9098db815a..41a6113aa7fa 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -569,6 +569,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 			struct iov_iter *io_iter)
 {
 	enum netfs_io_source source = NETFS_DOWNLOAD_FROM_SERVER;
+	struct netfs_inode *ictx = netfs_inode(rreq->inode);
 	size_t lsize;
 
 	_enter("%llx-%llx,%llx", subreq->start, subreq->start + subreq->len, rreq->i_size);
@@ -586,6 +587,14 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
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
@@ -607,6 +616,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
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
index fc77f7be220a..2005ad3b0e25 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -136,6 +136,8 @@ struct netfs_inode {
 	struct fscache_cookie	*cache;
 #endif
 	loff_t			remote_i_size;	/* Size of the remote file */
+	loff_t			zero_point;	/* Size after which we assume there's no data
+						 * on the server */
 	unsigned long		flags;
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
@@ -465,22 +467,30 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 {
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(&ctx->inode);
+	ctx->zero_point = ctx->remote_i_size;
 	ctx->flags = 0;
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

