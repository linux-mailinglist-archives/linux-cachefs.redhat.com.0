Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E759135714B
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 18:01:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-PcgH5szVO76zRNGliDhBBA-1; Wed, 07 Apr 2021 12:01:17 -0400
X-MC-Unique: PcgH5szVO76zRNGliDhBBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4677A107ACFE;
	Wed,  7 Apr 2021 16:01:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA21F5D9D0;
	Wed,  7 Apr 2021 16:01:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5B0F5533F;
	Wed,  7 Apr 2021 16:01:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136ELgtr015931 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 10:21:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A5761005B96; Tue,  6 Apr 2021 14:21:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7609E112D434
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 14:21:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEE9D805F47
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 14:21:37 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-6-YrlmcgFzMoSstytblzKywg-1; Tue, 06 Apr 2021 10:21:34 -0400
X-MC-Unique: YrlmcgFzMoSstytblzKywg-1
Received: by mail-lf1-f45.google.com with SMTP id v15so23056041lfq.5
	for <linux-cachefs@redhat.com>; Tue, 06 Apr 2021 07:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=z4dXCA52eL9yGYEpPl96DmhaClVisBUZpt2xtmJBb8M=;
	b=G5xiba8RRN8cRDmtb3GU+ZDmH+Wn6D52PSQTIOhm5c94mA0qUnR2PnbGmG1/19pymI
	Q8oHf02d0Mc7rJmoZ6x4m2uE48XEq4ZkIPAshYSPoduuoHZotw1vSCnMg0IOb5I5lFqN
	WfNQtSLOi2BUoYDDwHgYkbOjKYXHiAiB6tMJTlbxSP68tf1+Fs+O1V0+VPx/TYyhOMMU
	PMg7W/D1kINQ4ZMPycZUQQmQ3MQ/iqg1l6LVo0PTbkLY6JRyoQ0fVlyGrJjMM1qUd887
	mh9UkBCT3eGRwry/Zs68dOlX13K+nqermEwYp9s46PDXO/kkFQCH1WX2pmEeaqIHU37m
	Ph1Q==
X-Gm-Message-State: AOAM532j4Q+S4wzUVt0nPwmy3ZWDcm2rWfjtDClFenmLEWKv8o2HBij/
	fuJWuxxgdMdW6+JDXtmcYkkOKA==
X-Google-Smtp-Source: ABdhPJwF9aOPC9ghWeCjNX8vk/cr/PjNYGMD/2j84h1aHqOpZ4D87I8y7s/rUF+6j04Rmu5y2i8WMA==
X-Received: by 2002:ac2:4111:: with SMTP id b17mr20833051lfi.96.1617718892692; 
	Tue, 06 Apr 2021 07:21:32 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
	by smtp.gmail.com with ESMTPSA id
	f8sm2174697lfs.143.2021.04.06.07.21.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 06 Apr 2021 07:21:32 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id F2E47101FF7; Tue,  6 Apr 2021 17:21:34 +0300 (+03)
Date: Tue, 6 Apr 2021 17:21:34 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210406142134.tkxyy7ytib7vubf4@box.shutemov.name>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-2-willy@infradead.org>
	<20210406122918.h5dsnbjhmwpfasf4@box.shutemov.name>
	<20210406124807.GO2531743@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210406124807.GO2531743@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 06, 2021 at 01:48:07PM +0100, Matthew Wilcox wrote:
> Now, maybe we should put this optimisation into the definition of nth_page?

Sounds like a good idea to me.

> > > +struct folio {
> > > +	/* private: don't document the anon union */
> > > +	union {
> > > +		struct {
> > > +	/* public: */
> > > +			unsigned long flags;
> > > +			struct list_head lru;
> > > +			struct address_space *mapping;
> > > +			pgoff_t index;
> > > +			unsigned long private;
> > > +			atomic_t _mapcount;
> > > +			atomic_t _refcount;
> > > +#ifdef CONFIG_MEMCG
> > > +			unsigned long memcg_data;
> > > +#endif
> > 
> > As Christoph, I'm not a fan of this :/
> 
> What would you prefer?

I liked earlier approach with only struct page here. Once we know a field
should never be referenced from raw struct page, we can move it here.

But feel free to ignore my suggestion. It's not show-stopper for me and
reverting is back doesn't worth it.

I went through the patchset and it looks good. You can use my

  Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

on all of them.

Thanks a lot for doing this.

-- 
 Kirill A. Shutemov

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

