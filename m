Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E76712BAD4E
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605885506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rvKlzfeDkFF+HRF/xTUjEGOsrJidUSbBFIy0pn+0J5o=;
	b=Iwq2IB0978qQ/s02McA4xA0Yhi9G9ZGsW7pXCiGgSQ7DCMrPr9hAeIwoemSmpeW6mGakSe
	Klywd/w720MZ1Yfle3ljCQYzxzHrvFyCOgZhg/oHzvyUfJii19zUVMxZINcN9Q8MBknS6R
	JpIdV9gJYiOKBzFqm48N9yi1IBNRCNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-BsR-yjqsNEW6bYQwn2xUog-1; Fri, 20 Nov 2020 10:18:25 -0500
X-MC-Unique: BsR-yjqsNEW6bYQwn2xUog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48D2618B6141;
	Fri, 20 Nov 2020 15:18:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 399B85D9DC;
	Fri, 20 Nov 2020 15:18:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2611C180954D;
	Fri, 20 Nov 2020 15:18:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKFILox015604 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:18:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B292960861; Fri, 20 Nov 2020 15:18:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63E136085D;
	Fri, 20 Nov 2020 15:18:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 20 Nov 2020 15:18:13 +0000
Message-ID: <160588549356.3465195.17026181625185725385.stgit@warthog.procyon.org.uk>
In-Reply-To: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
References: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [RFC PATCH 72/76] afs: Invoke
 fscache_resize_cookie() when handling ATTR_SIZE for setattr
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

Invoke fscache_resize_cookie() to adjust the size of the backing cache
object when setattr is called with ATTR_SIZE.  This discards any data that
then lies beyond the revised EOF and frees up space.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/inode.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 51e55bfadb54..c639de101065 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -847,6 +847,9 @@ static void afs_setattr_edit_file(struct afs_operation *op)
 
 		if (size < i_size)
 			truncate_pagecache(inode, size);
+		if (size != i_size)
+			fscache_resize_cookie(afs_vnode_cache(vp->vnode),
+					      vp->scb.status.size);
 	}
 }
 
@@ -889,6 +892,8 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 			attr->ia_valid &= ~ATTR_SIZE;
 	}
 
+	fscache_use_cookie(afs_vnode_cache(vnode), true);
+
 	/* flush any dirty data outstanding on a regular file */
 	if (S_ISREG(vnode->vfs_inode.i_mode))
 		filemap_write_and_wait(vnode->vfs_inode.i_mapping);
@@ -919,6 +924,7 @@ int afs_setattr(struct dentry *dentry, struct iattr *attr)
 
 out_unlock:
 	up_write(&vnode->validate_lock);
+	fscache_unuse_cookie(afs_vnode_cache(vnode), NULL, NULL);
 	_leave(" = %d", ret);
 	return ret;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

