Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28B437E39
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:11:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929886;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mhp5qNh/babyy3Bxhj+uTar3GtbO2tvod8l3imXeIb0=;
	b=F9ny++BQy8pBf0ot48SbuVL4hpYYMiJDn+JB2zbBlVBWb+8+lmqi/amstrVjlcVwm2tE5v
	Ov1JO0On+mP2HIT7nc+x41aDRsdgdX7Wc/xy7afEbqZhLrZvK91tSsIL95HcVJi+ZFiEn8
	7dNg4OGLcko/F4muuLSFCKXZy2s1jL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-IHCoo9RpNZeamA107o0eQw-1; Fri, 22 Oct 2021 15:11:23 -0400
X-MC-Unique: IHCoo9RpNZeamA107o0eQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A4C10A8E01;
	Fri, 22 Oct 2021 19:11:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 027736418A;
	Fri, 22 Oct 2021 19:11:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2FD31818480;
	Fri, 22 Oct 2021 19:11:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ8rFc012940 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:08:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2329E101E594; Fri, 22 Oct 2021 19:08:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DBB31017E28;
	Fri, 22 Oct 2021 19:08:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:08:45 +0100
Message-ID: <163492972548.1038219.2862380188907793320.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Jeff Layton <jlayton@kernel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v2 43/53] afs: Make afs_write_begin() return
	the THP subpage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

generic_perform_write() can't handle a THP, so we have to return the
subpage of that THP from afs_write_begin() and then convert it back into
the head on entry to afs_write_end().

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-afs@lists.infradead.org
---

 fs/afs/write.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 19be3153d610..a01b1687a146 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -78,7 +78,7 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 			goto flush_conflicting_write;
 	}
 
-	*_page = page;
+	*_page = find_subpage(page, pos / PAGE_SIZE);
 	_leave(" = 0");
 	return 0;
 
@@ -108,9 +108,10 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
  */
 int afs_write_end(struct file *file, struct address_space *mapping,
 		  loff_t pos, unsigned len, unsigned copied,
-		  struct page *page, void *fsdata)
+		  struct page *subpage, void *fsdata)
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
+	struct page *page = thp_head(subpage);
 	unsigned long priv;
 	unsigned int f, from = offset_in_thp(page, pos);
 	unsigned int t, to = from + copied;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

