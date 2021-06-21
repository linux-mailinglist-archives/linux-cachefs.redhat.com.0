Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6A63AF7B5
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 23:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624311934;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j2H+Jddp7+QBbzQUy2rM5sMLw3NeTquGpTmimmoIGC4=;
	b=VyYwN7hnkanqurU+o/vTx9x7unmYK4xcQjW3EYywyM8uSyT2kAUig6OzXIHsfw8wD0IWYe
	esvbzsg1DC8+xiGCUyIXu6bLFtLKp1NmE4RdxsMKCJzYnp3DLF+DxZry/l0iYSb1QpaOIj
	HfDhPZW4TnpUm1Lryned5dqXHcES+i8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-tcHvXXQzNaKm1kTc9-9W8Q-1; Mon, 21 Jun 2021 17:45:33 -0400
X-MC-Unique: tcHvXXQzNaKm1kTc9-9W8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E164D804140;
	Mon, 21 Jun 2021 21:45:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D581A179B3;
	Mon, 21 Jun 2021 21:45:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0EC81809C99;
	Mon, 21 Jun 2021 21:45:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LLjUft030766 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 17:45:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39CBD5FC08; Mon, 21 Jun 2021 21:45:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7CD55C1C2;
	Mon, 21 Jun 2021 21:45:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 21 Jun 2021 22:45:24 +0100
Message-ID: <162431192403.2908479.4590814090994846904.stgit@warthog.procyon.org.uk>
In-Reply-To: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
References: <162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH 03/12] cachefiles: Use file_inode() rather
 than accessing ->f_inode
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the file_inode() helper rather than accessing ->f_inode directly.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/io.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index ca68bb97ca00..fac2e8e7b533 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -70,7 +70,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 
 	_enter("%pD,%li,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start_pos, len,
-	       i_size_read(file->f_inode));
+	       i_size_read(file_inode(file)));
 
 	/* If the caller asked us to seek for data before doing the read, then
 	 * we should do that now.  If we find a gap, we fill it with zeros.
@@ -194,7 +194,7 @@ static int cachefiles_write(struct netfs_cache_resources *cres,
 
 	_enter("%pD,%li,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start_pos, len,
-	       i_size_read(file->f_inode));
+	       i_size_read(file_inode(file)));
 
 	ki = kzalloc(sizeof(struct cachefiles_kiocb), GFP_KERNEL);
 	if (!ki)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

