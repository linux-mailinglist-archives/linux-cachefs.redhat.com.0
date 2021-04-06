Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9779E35714C
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 18:02:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188--ZsBNAF-OE-EOOhzz1r5Ig-1; Wed, 07 Apr 2021 12:02:41 -0400
X-MC-Unique: -ZsBNAF-OE-EOOhzz1r5Ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76CE383DD22;
	Wed,  7 Apr 2021 16:02:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C22818796;
	Wed,  7 Apr 2021 16:02:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2420255341;
	Wed,  7 Apr 2021 16:02:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136CTQwx003455 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 08:29:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77C9E6E1A0; Tue,  6 Apr 2021 12:29:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 710786E1A5
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 12:29:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AED4C104D992
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 12:29:22 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-580-NiJ2GQhAOTagoyEGQPP8SQ-1; Tue, 06 Apr 2021 08:29:18 -0400
X-MC-Unique: NiJ2GQhAOTagoyEGQPP8SQ-1
Received: by mail-lf1-f43.google.com with SMTP id d13so22432744lfg.7
	for <linux-cachefs@redhat.com>; Tue, 06 Apr 2021 05:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=57Sd0MjVPJwj9C8CqpwruZwhDWQJmwCtp4DcDbeYrF8=;
	b=fxlsV25wdqUnSved5w9tCpCQapI8XR76xES20f6ebrRphR0DIoix/5Wks8WVuReXB9
	YwTeU0nKkDbk19pbnPWy+O2unwGRu5wOGDpfWs6BSxxfTzkrcNS09R03LPyQnieAqjZA
	Tvf1jRzmjCuGfE0NnYL+vFAzi5a9zCEcooXI+MYDRDAFO1uQDeDIGf2DeswapKxSI1Yz
	ZBagZY74H6F3MJOgdGSxwBTstpI2m1YSmRqxOfdDMkFJQQ2zdXjYySP4vfbS48xvQLfH
	j3WFLwbBNTDZiSs1DxVx8fnhMKbWk/fxRrS7rg4mt/NAfAjONVoqen332s3vtF1rmy0Z
	X4iQ==
X-Gm-Message-State: AOAM532ym6ClUl2mtk16S5US8xDvVGViYouRt10/p2xyk0xpObKiNMUz
	/frA0aiedLiUbuLHSoOlrLHwtA==
X-Google-Smtp-Source: ABdhPJwN+7HNNe6vl5shpanay18CZEn+2wHwc1TZiipOq36OoeeDMJquiT51ffeyPvbSUxAjHkldig==
X-Received: by 2002:a19:ee0d:: with SMTP id g13mr21536160lfb.38.1617712156785; 
	Tue, 06 Apr 2021 05:29:16 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
	by smtp.gmail.com with ESMTPSA id
	q7sm2197962lfc.260.2021.04.06.05.29.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 06 Apr 2021 05:29:16 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 9E879101FF7; Tue,  6 Apr 2021 15:29:18 +0300 (+03)
Date: Tue, 6 Apr 2021 15:29:18 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20210406122918.h5dsnbjhmwpfasf4@box.shutemov.name>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-2-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210331184728.1188084-2-willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 07 Apr 2021 12:00:51 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 31, 2021 at 07:47:02PM +0100, Matthew Wilcox (Oracle) wrote:
> +/**
> + * folio_next - Move to the next physical folio.
> + * @folio: The folio we're currently operating on.
> + *
> + * If you have physically contiguous memory which may span more than
> + * one folio (eg a &struct bio_vec), use this function to move from one
> + * folio to the next.  Do not use it if the memory is only virtually
> + * contiguous as the folios are almost certainly not adjacent to each
> + * other.  This is the folio equivalent to writing ``page++``.
> + *
> + * Context: We assume that the folios are refcounted and/or locked at a
> + * higher level and do not adjust the reference counts.
> + * Return: The next struct folio.
> + */
> +static inline struct folio *folio_next(struct folio *folio)
> +{
> +#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
> +	return (struct folio *)nth_page(&folio->page, folio_nr_pages(folio));
> +#else
> +	return folio + folio_nr_pages(folio);
> +#endif

Do we really need the #if here?

>From quick look at nth_page() and memory_model.h, compiler should be able
to simplify calculation for FLATMEM or SPARSEMEM_VMEMMAP to what you do in
the #else. No?

> @@ -224,6 +224,71 @@ struct page {
>  #endif
>  } _struct_page_alignment;
>  
> +/**
> + * struct folio - Represents a contiguous set of bytes.
> + * @flags: Identical to the page flags.
> + * @lru: Least Recently Used list; tracks how recently this folio was used.
> + * @mapping: The file this page belongs to, or refers to the anon_vma for
> + *    anonymous pages.
> + * @index: Offset within the file, in units of pages.  For anonymous pages,
> + *    this is the index from the beginning of the mmap.
> + * @private: Filesystem per-folio data (see attach_folio_private()).
> + *    Used for swp_entry_t if FolioSwapCache().
> + * @_mapcount: How many times this folio is mapped to userspace.  Use
> + *    folio_mapcount() to access it.
> + * @_refcount: Number of references to this folio.  Use folio_ref_count()
> + *    to read it.
> + * @memcg_data: Memory Control Group data.
> + *
> + * A folio is a physically, virtually and logically contiguous set
> + * of bytes.  It is a power-of-two in size, and it is aligned to that
> + * same power-of-two.  It is at least as large as %PAGE_SIZE.  If it is
> + * in the page cache, it is at a file offset which is a multiple of that
> + * power-of-two.
> + */
> +struct folio {
> +	/* private: don't document the anon union */
> +	union {
> +		struct {
> +	/* public: */
> +			unsigned long flags;
> +			struct list_head lru;
> +			struct address_space *mapping;
> +			pgoff_t index;
> +			unsigned long private;
> +			atomic_t _mapcount;
> +			atomic_t _refcount;
> +#ifdef CONFIG_MEMCG
> +			unsigned long memcg_data;
> +#endif

As Christoph, I'm not a fan of this :/

> +	/* private: the union with struct page is transitional */
> +		};
> +		struct page page;
> +	};
> +};

-- 
 Kirill A. Shutemov

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

