Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3D28F3514E8
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Apr 2021 14:52:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-MfubplJ6Of-U6fEPZS11zw-1; Thu, 01 Apr 2021 08:52:32 -0400
X-MC-Unique: MfubplJ6Of-U6fEPZS11zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05C41800D53;
	Thu,  1 Apr 2021 12:52:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A01D5C649;
	Thu,  1 Apr 2021 12:52:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 069901809C83;
	Thu,  1 Apr 2021 12:52:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 131CqNMW017280 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 08:52:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD53A2156A23; Thu,  1 Apr 2021 12:52:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C835A2156A21
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 12:52:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2922F800B23
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 12:52:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-147-9-whzTFkMvuujNMC6YrjqA-1; Thu, 01 Apr 2021 08:52:16 -0400
X-MC-Unique: 9-whzTFkMvuujNMC6YrjqA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRwnp-0068jn-3I; Thu, 01 Apr 2021 12:52:05 +0000
Date: Thu, 1 Apr 2021 13:52:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20210401125201.GD351017@casper.infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210401070537.GB1363493@infradead.org>
	<20210401112656.GA351017@casper.infradead.org>
	<20210401122803.GB2710221@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210401122803.GB2710221@ziepe.ca>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 00/27] Memory Folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 01, 2021 at 09:28:03AM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 01, 2021 at 12:26:56PM +0100, Matthew Wilcox wrote:
> > On Thu, Apr 01, 2021 at 08:05:37AM +0100, Christoph Hellwig wrote:
> > > On Wed, Mar 31, 2021 at 07:47:01PM +0100, Matthew Wilcox (Oracle) wrote:
> > > >  - Mirror members of struct page (for pagecache / anon) into struct folio,
> > > >    so (eg) you can use folio->mapping instead of folio->page.mapping
> > > 
> > > Eww, why?
> > 
> > So that eventually we can rename page->mapping to page->_mapping and
> > prevent the bugs from people doing page->mapping on a tail page.  eg
> > https://lore.kernel.org/linux-mm/alpine.LSU.2.11.2103102214170.7159@eggly.anvils/
> 
> Is that gcc structure layout randomization stuff going to be a problem
> here?
> 
> Add some 
>   static_assert(offsetof(struct folio,..) == offsetof(struct page,..))
> 
> tests to force it?

You sound like the kind of person who hasn't read patch 1.

diff --git a/mm/util.c b/mm/util.c
index 0b6dd9d81da7..521a772f06eb 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -686,6 +686,25 @@ struct anon_vma *page_anon_vma(struct page *page)
 	return __page_rmapping(page);
 }
 
+static inline void folio_build_bug(void)
+{
+#define FOLIO_MATCH(pg, fl)						\
+BUILD_BUG_ON(offsetof(struct page, pg) != offsetof(struct folio, fl));
+
+	FOLIO_MATCH(flags, flags);
+	FOLIO_MATCH(lru, lru);
+	FOLIO_MATCH(mapping, mapping);
+	FOLIO_MATCH(index, index);
+	FOLIO_MATCH(private, private);
+	FOLIO_MATCH(_mapcount, _mapcount);
+	FOLIO_MATCH(_refcount, _refcount);
+#ifdef CONFIG_MEMCG
+	FOLIO_MATCH(memcg_data, memcg_data);
+#endif
+#undef FOLIO_MATCH
+	BUILD_BUG_ON(sizeof(struct page) != sizeof(struct folio));
+}
+
 struct address_space *page_mapping(struct page *page)
 {
 	struct address_space *mapping;

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

