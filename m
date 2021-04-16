Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2664C3624B3
	for <lists+linux-cachefs@lfdr.de>; Fri, 16 Apr 2021 17:56:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-jYNIo0phMCanLgStQr0I8w-1; Fri, 16 Apr 2021 11:56:47 -0400
X-MC-Unique: jYNIo0phMCanLgStQr0I8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E43A6D5B2;
	Fri, 16 Apr 2021 15:56:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D405D9E3;
	Fri, 16 Apr 2021 15:56:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECCBA1809C82;
	Fri, 16 Apr 2021 15:56:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13GFuaqS011891 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 16 Apr 2021 11:56:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A24C020F8C2E; Fri, 16 Apr 2021 15:56:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DDE620F8C0A
	for <linux-cachefs@redhat.com>; Fri, 16 Apr 2021 15:56:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C0DA80080F
	for <linux-cachefs@redhat.com>; Fri, 16 Apr 2021 15:56:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-161-gSbUa1d2P3q7hkpHVlnT4Q-1; Fri, 16 Apr 2021 11:56:29 -0400
X-MC-Unique: gSbUa1d2P3q7hkpHVlnT4Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lXQoO-00A9P7-AQ; Fri, 16 Apr 2021 15:55:50 +0000
Date: Fri, 16 Apr 2021 16:55:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: linux-mm@kvack.org
Message-ID: <20210416155516.GM2531743@casper.infradead.org>
References: <20210409185105.188284-1-willy@infradead.org>
	<20210409185105.188284-3-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210409185105.188284-3-willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v7 02/28] mm: Introduce struct folio
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 09, 2021 at 07:50:39PM +0100, Matthew Wilcox (Oracle) wrote:
> A struct folio is a new abstraction to replace the venerable struct page.
> A function which takes a struct folio argument declares that it will
> operate on the entire (possibly compound) page, not just PAGE_SIZE bytes.
> In return, the caller guarantees that the pointer it is passing does
> not point to a tail page.
> +++ b/include/linux/mm_types.h
[...]
> +static inline struct folio *page_folio(struct page *page)
> +{
> +	unsigned long head = READ_ONCE(page->compound_head);
> +
> +	if (unlikely(head & 1))
> +		return (struct folio *)(head - 1);
> +	return (struct folio *)page;
> +}

I'm looking at changing this for the next revision, and basing it on
my recent patch to make compound_head() const-preserving:

+#define page_folio(page)       _Generic((page),                        \
+       const struct page *:    (const struct folio *)_compound_head(page), \
+       struct page *:          (struct folio *)_compound_head(page))

I've also noticed an awkward pattern occurring that I think this makes
less awkward:

+/**
+ * folio_page - Return a page from a folio.
+ * @folio: The folio.
+ * @n: The page number to return.
+ *
+ * @n is relative to the start of the folio.  It should be between
+ * 0 and folio_nr_pages(@folio) - 1, but this is not checked for.
+ */
+#define folio_page(folio, n)   nth_page(&(folio)->page, n)

That lets me simplify folio_next():

+static inline struct folio *folio_next(struct folio *folio)
+{
+       return (struct folio *)folio_page(folio, folio_nr_pages(folio));
+}

(it occurs to me this should also be const-preserving, but it's not clear
that's needed yet)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

