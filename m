Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D5416355440
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 14:49:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-qeK4P_zZNmCXZ0_fslyNMw-1; Tue, 06 Apr 2021 08:49:02 -0400
X-MC-Unique: qeK4P_zZNmCXZ0_fslyNMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0C97108BD09;
	Tue,  6 Apr 2021 12:48:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA0796062F;
	Tue,  6 Apr 2021 12:48:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF4B11809C83;
	Tue,  6 Apr 2021 12:48:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136Cmq0O005230 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 08:48:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6593E2166B44; Tue,  6 Apr 2021 12:48:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 088582166BA9
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 12:48:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68BA1104D992
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 12:48:49 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-5-G9js55CvMEOvv31N7NWh5w-1; Tue, 06 Apr 2021 08:48:47 -0400
X-MC-Unique: G9js55CvMEOvv31N7NWh5w-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lTl7n-00CoN1-SM; Tue, 06 Apr 2021 12:48:27 +0000
Date: Tue, 6 Apr 2021 13:48:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Message-ID: <20210406124807.GO2531743@casper.infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-2-willy@infradead.org>
	<20210406122918.h5dsnbjhmwpfasf4@box.shutemov.name>
MIME-Version: 1.0
In-Reply-To: <20210406122918.h5dsnbjhmwpfasf4@box.shutemov.name>
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 01/27] mm: Introduce struct folio
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 06, 2021 at 03:29:18PM +0300, Kirill A. Shutemov wrote:
> On Wed, Mar 31, 2021 at 07:47:02PM +0100, Matthew Wilcox (Oracle) wrote:
> > +/**
> > + * folio_next - Move to the next physical folio.
> > + * @folio: The folio we're currently operating on.
> > + *
> > + * If you have physically contiguous memory which may span more than
> > + * one folio (eg a &struct bio_vec), use this function to move from one
> > + * folio to the next.  Do not use it if the memory is only virtually
> > + * contiguous as the folios are almost certainly not adjacent to each
> > + * other.  This is the folio equivalent to writing ``page++``.
> > + *
> > + * Context: We assume that the folios are refcounted and/or locked at a
> > + * higher level and do not adjust the reference counts.
> > + * Return: The next struct folio.
> > + */
> > +static inline struct folio *folio_next(struct folio *folio)
> > +{
> > +#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
> > +	return (struct folio *)nth_page(&folio->page, folio_nr_pages(folio));
> > +#else
> > +	return folio + folio_nr_pages(folio);
> > +#endif
> 
> Do we really need the #if here?
> 
> >From quick look at nth_page() and memory_model.h, compiler should be able
> to simplify calculation for FLATMEM or SPARSEMEM_VMEMMAP to what you do in
> the #else. No?

No.

0000000000001180 <a>:
struct page *a(struct page *p, unsigned long n)
{
    1180:       e8 00 00 00 00          callq  1185 <a+0x5>
                        1181: R_X86_64_PLT32    __fentry__-0x4
    1185:       55                      push   %rbp
        return nth_page(p, n);
    1186:       48 2b 3d 00 00 00 00    sub    0x0(%rip),%rdi
                        1189: R_X86_64_PC32     vmemmap_base-0x4
    118d:       48 c1 ff 06             sar    $0x6,%rdi
    1191:       48 8d 04 37             lea    (%rdi,%rsi,1),%rax
    1195:       48 89 e5                mov    %rsp,%rbp
        return nth_page(p, n);
    1198:       48 c1 e0 06             shl    $0x6,%rax
    119c:       48 03 05 00 00 00 00    add    0x0(%rip),%rax
                        119f: R_X86_64_PC32     vmemmap_base-0x4
    11a3:       5d                      pop    %rbp
    11a4:       c3                      retq   

vs

00000000000011b0 <b>:

struct page *b(struct page *p, unsigned long n)
{
    11b0:       e8 00 00 00 00          callq  11b5 <b+0x5>
                        11b1: R_X86_64_PLT32    __fentry__-0x4
    11b5:       55                      push   %rbp
        return p + n;
    11b6:       48 c1 e6 06             shl    $0x6,%rsi
    11ba:       48 8d 04 37             lea    (%rdi,%rsi,1),%rax
    11be:       48 89 e5                mov    %rsp,%rbp
    11c1:       5d                      pop    %rbp
    11c2:       c3                      retq   

Now, maybe we should put this optimisation into the definition of nth_page?

> > +struct folio {
> > +	/* private: don't document the anon union */
> > +	union {
> > +		struct {
> > +	/* public: */
> > +			unsigned long flags;
> > +			struct list_head lru;
> > +			struct address_space *mapping;
> > +			pgoff_t index;
> > +			unsigned long private;
> > +			atomic_t _mapcount;
> > +			atomic_t _refcount;
> > +#ifdef CONFIG_MEMCG
> > +			unsigned long memcg_data;
> > +#endif
> 
> As Christoph, I'm not a fan of this :/

What would you prefer?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

