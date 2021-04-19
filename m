Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 47529363E44
	for <lists+linux-cachefs@lfdr.de>; Mon, 19 Apr 2021 11:09:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-9CKMvsWrNx-2-ta3lBOIyA-1; Mon, 19 Apr 2021 05:09:21 -0400
X-MC-Unique: 9CKMvsWrNx-2-ta3lBOIyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CB5F107ACC7;
	Mon, 19 Apr 2021 09:09:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07E725D9C0;
	Mon, 19 Apr 2021 09:09:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03E5A44A58;
	Mon, 19 Apr 2021 09:09:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13J96VZP026093 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 05:06:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F30F42182DF7; Mon, 19 Apr 2021 09:06:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8082182DF6
	for <linux-cachefs@redhat.com>; Mon, 19 Apr 2021 09:06:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84CF5801E8D
	for <linux-cachefs@redhat.com>; Mon, 19 Apr 2021 09:06:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-429-jHJtpKkoMQWGYdvd-oodQg-1; Mon, 19 Apr 2021 05:06:25 -0400
X-MC-Unique: jHJtpKkoMQWGYdvd-oodQg-1
Received: by mail-lf1-f45.google.com with SMTP id z13so37743345lfd.9
	for <linux-cachefs@redhat.com>; Mon, 19 Apr 2021 02:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=rWuG5NeIc1o/ad5klAkavJ7HFtGU9PaK/EU9Glk/tKw=;
	b=J2u80SBfMjEH38wijyCu8jjidYxsBUQbU47j1k4Bhh3N6BmxaTqUTTomDgTMjCv+qm
	VM7k6+MG+tJR9xm7eHEzeo2B70YzU8Sy+eBBOyMjkWrcxvLeNE0iu/nNvIj0hmXiAJpU
	kUPHtJn19KW1kExCa+ewCzhRsZp+3l78N2RdOPxNE/Zcf4XYjCZ5owYyN+X8uSZJ8k9e
	bd5InM/7Cve9B13MmC7T0hg1SHeruVoluGa013OCCVZ4Kn2RTBzuRs3bp2hKj5Wx9cph
	z9sQMdN4GQfDnhL8OOYan/AQ/kjclZLwnpJAv92l8eaxOchN0jTvULUTPwT5KbEDG8zc
	WdlA==
X-Gm-Message-State: AOAM531Z1sH3aX7Ox1YQ7Q22sNh+9D4NbI8pzzOK/8QpR/jMdYl0TeBD
	gLrn+HAzwJm/bWQid2T0TWlTxeg+KPmujg==
X-Google-Smtp-Source: ABdhPJyQ+cekKtiDshFu5qbboMb9ko0+ZqNUwPVYvJjUx458DCCdyMl9xVyFjwKyT1+D6M/uxZ6B0w==
X-Received: by 2002:a05:6512:b26:: with SMTP id
	w38mr11467105lfu.152.1618823184183; 
	Mon, 19 Apr 2021 02:06:24 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
	by smtp.gmail.com with ESMTPSA id k5sm38284ljg.33.2021.04.19.02.06.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 19 Apr 2021 02:06:23 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id A07E3102567; Mon, 19 Apr 2021 12:06:22 +0300 (+03)
Date: Mon, 19 Apr 2021 12:06:22 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210419090622.bjz7flufdjiaou7k@box.shutemov.name>
References: <20210409185105.188284-1-willy@infradead.org>
	<20210409185105.188284-3-willy@infradead.org>
	<20210416155516.GM2531743@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210416155516.GM2531743@casper.infradead.org>
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
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

On Fri, Apr 16, 2021 at 04:55:16PM +0100, Matthew Wilcox wrote:
> On Fri, Apr 09, 2021 at 07:50:39PM +0100, Matthew Wilcox (Oracle) wrote:
> > A struct folio is a new abstraction to replace the venerable struct page.
> > A function which takes a struct folio argument declares that it will
> > operate on the entire (possibly compound) page, not just PAGE_SIZE bytes.
> > In return, the caller guarantees that the pointer it is passing does
> > not point to a tail page.
> > +++ b/include/linux/mm_types.h
> [...]
> > +static inline struct folio *page_folio(struct page *page)
> > +{
> > +	unsigned long head = READ_ONCE(page->compound_head);
> > +
> > +	if (unlikely(head & 1))
> > +		return (struct folio *)(head - 1);
> > +	return (struct folio *)page;
> > +}
> 
> I'm looking at changing this for the next revision, and basing it on
> my recent patch to make compound_head() const-preserving:
> 
> +#define page_folio(page)       _Generic((page),                        \
> +       const struct page *:    (const struct folio *)_compound_head(page), \
> +       struct page *:          (struct folio *)_compound_head(page))
> 
> I've also noticed an awkward pattern occurring that I think this makes
> less awkward:
> 
> +/**
> + * folio_page - Return a page from a folio.
> + * @folio: The folio.
> + * @n: The page number to return.
> + *
> + * @n is relative to the start of the folio.  It should be between
> + * 0 and folio_nr_pages(@folio) - 1, but this is not checked for.
> + */
> +#define folio_page(folio, n)   nth_page(&(folio)->page, n)
> 
> That lets me simplify folio_next():
> 
> +static inline struct folio *folio_next(struct folio *folio)
> +{
> +       return (struct folio *)folio_page(folio, folio_nr_pages(folio));
> +}
> 
> (it occurs to me this should also be const-preserving, but it's not clear
> that's needed yet)

Are we risking that we would need to replace inline functions with macros
all the way down? Not sure const-preserving worth it.

-- 
 Kirill A. Shutemov

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

