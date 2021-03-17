Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 826A933EEFE
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Mar 2021 12:00:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-ITpPRWFxPIiXv-q0GCYjIg-1; Wed, 17 Mar 2021 07:00:47 -0400
X-MC-Unique: ITpPRWFxPIiXv-q0GCYjIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8638357035;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EE8D69323;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 482C21809C83;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12H0pe8k030246 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 20:51:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CED2AB5B3; Wed, 17 Mar 2021 00:51:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 172C3BDC5A
	for <linux-cachefs@redhat.com>; Wed, 17 Mar 2021 00:51:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D91285A5B5
	for <linux-cachefs@redhat.com>; Wed, 17 Mar 2021 00:51:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-343-E5GEXc84NJOjgDQ32bikhg-1; Tue, 16 Mar 2021 20:51:33 -0400
X-MC-Unique: E5GEXc84NJOjgDQ32bikhg-1
Received: by mail-lf1-f46.google.com with SMTP id t18so403287lfl.3
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 17:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hdc3Z4qXX9l8XXJJcPsajObPuLYLca+A1Hq/au570EA=;
	b=VaSFPB1qdxztWR76jvwrPeX57J/cBr+XgYpMbU/zXMeTN9CArxxo8BuzMDAESE5Fpk
	m5a1wdQW56G9Lan5AEvsFFbeATZvYx6dtAQ38fYZMkvYv76dMYsBc2gqX1gsBRmbVyxS
	EthFvPsGWQKwSz2Knz4SNmD/XQImsdrTvEqKY466CyGuCD2/WhbCc/jX0H6hnKrPMs2K
	t8BGL1SLRUkv7Y9BHHaL5Dsfi22DveXTGke9XHP2AJ7qRhZ6Ikuyt6XgGrLOQHR+4vVZ
	9BiPQ8nuMYANNq+b5g6SRszt9tc/9V4KTg8EJxUDpcHsTZIR1Pz0v5q2NoYG5GA2sqoK
	taTw==
X-Gm-Message-State: AOAM531xMFlNRixsJJkuHhOMjxUlfEc+LdKvCiCrO8ZsFgki3m2BLaUY
	RVM0KOfaboP18+jMCcdAyO/Ckk3jNfh96Q==
X-Google-Smtp-Source: ABdhPJzdrbQTTDzmJ5CG+d/3Q0JfYMGsP8Ck0ykSb4zLpPrPCBuRJ/M3uwQ+hcfb59o7Vi8Doa0B2Q==
X-Received: by 2002:ac2:5509:: with SMTP id j9mr791943lfk.302.1615942291555;
	Tue, 16 Mar 2021 17:51:31 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
	[209.85.167.41])
	by smtp.gmail.com with ESMTPSA id u5sm147234lft.284.2021.03.16.17.51.31
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 16 Mar 2021 17:51:31 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id e7so410337lft.2
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 17:51:31 -0700 (PDT)
X-Received: by 2002:ac2:4250:: with SMTP id m16mr745431lfl.40.1615941846610;
	Tue, 16 Mar 2021 17:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<20210316190707.GD3420@casper.infradead.org>
In-Reply-To: <20210316190707.GD3420@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Mar 2021 17:43:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSGsRj7xwhSMQ6dAQiz53xA39pOG+XA_WeTgwBBu4uqg@mail.gmail.com>
Message-ID: <CAHk-=wjSGsRj7xwhSMQ6dAQiz53xA39pOG+XA_WeTgwBBu4uqg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
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
X-Mailman-Approved-At: Wed, 17 Mar 2021 07:00:38 -0400
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, CIFS <linux-cifs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Linux-MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
	PG_private_2/PG_fscache
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

[ Adding btrfs people explicitly, maybe they see this on the fs-devel
list, but maybe they don't react .. ]

On Tue, Mar 16, 2021 at 12:07 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> This isn't a problem with this patch per se, but I'm concerned about
> private2 and expected page refcounts.

Ugh. You are very right.

It would be good to just change the rules - I get the feeling nobody
actually depended on them anyway because they were _so_ esoteric.

> static inline int is_page_cache_freeable(struct page *page)
> {
>         /*
>          * A freeable page cache page is referenced only by the caller
>          * that isolated the page, the page cache and optional buffer
>          * heads at page->private.
>          */
>         int page_cache_pins = thp_nr_pages(page);
>         return page_count(page) - page_has_private(page) == 1 + page_cache_pins;

You're right, that "page_has_private()" is really really nasty.

The comment is, I think, the traditional usage case, which used to be
about page->buffers. Obviously these days it is now about
page->private with PG_private set, pointing to buffers
(attach_page_private() and detach_page_private()).

But as you point out:

> #define PAGE_FLAGS_PRIVATE                              \
>         (1UL << PG_private | 1UL << PG_private_2)
>
> So ... a page with both flags cleared should have a refcount of N.
> A page with one or both flags set should have a refcount of N+1.

Could we just remove the PG_private_2 thing in this context entirely,
and make the rule be that

 (a) PG_private means that you have some local private data in
page->private, and that's all that matters for the "freeable" thing.

 (b) PG_private_2 does *not* have the same meaning, and has no bearing
on freeability (and only the refcount matters)

I _)think_ the btrfs behavior is to only use PagePrivate2() when it
has a reference to the page, so btrfs doesn't care?

I think fscache is already happy to take the page count when using
PG_private_2 for locking, exactly because I didn't want to have any
confusion about lifetimes. But this "page_has_private()" math ends up
meaning it's confusing anyway.

btrfs people? What are the semantics for PG_private_2? Is it just a
flag, and you really don't want it to have anything to do with any
page lifetime decisions? Or?

        Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

