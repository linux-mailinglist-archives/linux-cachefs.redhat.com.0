Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A269E302DB5
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jan 2021 22:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611610312;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ug2JA3LBOFVd+JWsry4kmfYWZfeQnzJBbjmJfpmZ6Ss=;
	b=AyGsSG5M5MBMZAp3wz/FO3LV0xZ2W9f7rnTwzTpBeGH3DTyVX3RpGdwKzOqF1CdPODn5JB
	BoS5t8l8BpxeEKSS+z6ODOHV1SlB5AG8djBR2qwIUxh4x+uIV3ZQcPMM0GZoK5W2FKSZa7
	KAHzFAaX3K12RI7D390Qtnfj93Z4G6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-GMOsteywNkyYqT-UHbQSHw-1; Mon, 25 Jan 2021 16:31:49 -0500
X-MC-Unique: GMOsteywNkyYqT-UHbQSHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 209C68735C1;
	Mon, 25 Jan 2021 21:31:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F2225D9DC;
	Mon, 25 Jan 2021 21:31:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E929518095FF;
	Mon, 25 Jan 2021 21:31:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PLVjjh027642 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 16:31:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 169B619D80; Mon, 25 Jan 2021 21:31:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97EDE19C47;
	Mon, 25 Jan 2021 21:31:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Mon, 25 Jan 2021 21:31:38 +0000
Message-ID: <161161029886.2537118.16203680320843226514.stgit@warthog.procyon.org.uk>
In-Reply-To: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 04/32] vfs: Export rw_verify_area() for use
	by cachefiles
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Export rw_verify_area() for so that cachefiles can use it before issuing
call_read_iter() and call_write_iter() to effect async DIO operations
against the cache.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/internal.h      |    5 -----
 fs/read_write.c    |    1 +
 include/linux/fs.h |    1 +
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index 77c50befbfbe..92e686249c40 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -164,11 +164,6 @@ extern char *simple_dname(struct dentry *, char *, int);
 extern void dput_to_list(struct dentry *, struct list_head *);
 extern void shrink_dentry_list(struct list_head *);
 
-/*
- * read_write.c
- */
-extern int rw_verify_area(int, struct file *, const loff_t *, size_t);
-
 /*
  * pipe.c
  */
diff --git a/fs/read_write.c b/fs/read_write.c
index 75f764b43418..fe84e11245bd 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -400,6 +400,7 @@ int rw_verify_area(int read_write, struct file *file, const loff_t *ppos, size_t
 	return security_file_permission(file,
 				read_write == READ ? MAY_READ : MAY_WRITE);
 }
+EXPORT_SYMBOL(rw_verify_area);
 
 static ssize_t new_sync_read(struct file *filp, char __user *buf, size_t len, loff_t *ppos)
 {
diff --git a/include/linux/fs.h b/include/linux/fs.h
index fd47deea7c17..493804856ab3 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2760,6 +2760,7 @@ extern int notify_change(struct dentry *, struct iattr *, struct inode **);
 extern int inode_permission(struct inode *, int);
 extern int generic_permission(struct inode *, int);
 extern int __check_sticky(struct inode *dir, struct inode *inode);
+extern int rw_verify_area(int, struct file *, const loff_t *, size_t);
 
 static inline bool execute_ok(struct inode *inode)
 {


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

