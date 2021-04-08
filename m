Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09E96359D26
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 13:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617967157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jvhwlS5EkXd20oqiSbEGFlvod5FgjYDYBiUm6UbwRAY=;
	b=Z+UrNUgC0ixu4aHD2a24DkIVmz2ZPLq05uedWh4Hq6DJsTgzjCieoM3dFPC9u8iNVZb9mV
	RZcmbvtl/nFeySe6xjvEQerLJcRq18BoLKLDcyKNaVoRasx08pld6SX77WGvBSPWPEL3aW
	3U6iH2cq6i3+nYFnSJZw4ac49EC2coY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-s2UId2XxNLWw4rdPMT9A0A-1; Fri, 09 Apr 2021 07:19:15 -0400
X-MC-Unique: s2UId2XxNLWw4rdPMT9A0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C52365B38C;
	Fri,  9 Apr 2021 11:19:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5EE45D9F2;
	Fri,  9 Apr 2021 11:19:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A13785533E;
	Fri,  9 Apr 2021 11:19:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 138Fvd76007462 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 8 Apr 2021 11:57:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF65C5C22A; Thu,  8 Apr 2021 15:57:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE165C1C4;
	Thu,  8 Apr 2021 15:57:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210408145057.GN2531743@casper.infradead.org>
References: <20210408145057.GN2531743@casper.infradead.org>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789066013.6155.9816857201817288382.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 08 Apr 2021 16:57:31 +0100
Message-ID: <46017.1617897451@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 138Fvd76007462
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 09 Apr 2021 07:19:11 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Steve French <sfrench@samba.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v6 02/30] mm: Add set/end/wait functions
	for PG_private_2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <46016.1617897451.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here's a partial change, but we still need to deal with the assumption that
page_has_private() makes that its output can be used to count the number of
refs held for PG_private *and* PG_private_2 - which isn't true for my code
here.

David
---
commit e7c28d83b84b972c3faa0dd86020548aa50eda75
Author: David Howells <dhowells@redhat.com>
Date:   Thu Apr 8 16:33:20 2021 +0100

    netfs: Fix PG_private_2 helper functions to consistently use compound_head()

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ef511364cc0c..63ca6430aef5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -699,6 +699,7 @@ void page_endio(struct page *page, bool is_write, int err);
  */
 static inline void set_page_private_2(struct page *page)
 {
+	page = compound_head(page);
 	get_page(page);
 	SetPagePrivate2(page);
 }
diff --git a/mm/filemap.c b/mm/filemap.c
index 0ce93c8799ca..46e0321ba87a 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1461,6 +1461,7 @@ EXPORT_SYMBOL(end_page_private_2);
  */
 void wait_on_page_private_2(struct page *page)
 {
+	page = compound_head(page);
 	while (PagePrivate2(page))
 		wait_on_page_bit(page, PG_private_2);
 }
@@ -1481,6 +1482,7 @@ int wait_on_page_private_2_killable(struct page *page)
 {
 	int ret = 0;
 
+	page = compound_head(page);
 	while (PagePrivate2(page)) {
 		ret = wait_on_page_bit_killable(page, PG_private_2);
 		if (ret < 0)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

