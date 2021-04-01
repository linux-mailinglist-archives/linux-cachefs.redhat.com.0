Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 94BFE351680
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Apr 2021 18:00:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-exrdWtuROtiC3YxyHsnWEw-1; Thu, 01 Apr 2021 12:00:26 -0400
X-MC-Unique: exrdWtuROtiC3YxyHsnWEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30B59E49EA;
	Thu,  1 Apr 2021 16:00:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F301C6F98A;
	Thu,  1 Apr 2021 16:00:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF1BF4BB7B;
	Thu,  1 Apr 2021 16:00:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 131G0Hxl007663 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 12:00:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0D4010EB2B5; Thu,  1 Apr 2021 16:00:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A703C10EB298
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 16:00:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DD89101A52C
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 16:00:15 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-220-p6BIXeNgOJuXcRah7_9GCQ-1; Thu, 01 Apr 2021 12:00:12 -0400
X-MC-Unique: p6BIXeNgOJuXcRah7_9GCQ-1
Received: by mail-qk1-f174.google.com with SMTP id y5so2635742qkl.9
	for <linux-cachefs@redhat.com>; Thu, 01 Apr 2021 09:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=G/+9Hb7YYQmA2SssmIOWqXZ0kNaROHWnX1DvJqmrmNI=;
	b=Brdzc8XtuT+okMP04JsPNPmUUPIdLRAC8stf5yDk1yHysGEIsOhcZZ8qZG2U+AHsyE
	z+y5eXJVKzfjoxHXbzlCBvK3rwhxzXGzTnCyG5gnqxe+Zf68lNHjTm9KwOuGHa9TK1M2
	kbHjupYmCIA/+XGxE2Vf8QYG1/aadjJZ/F1+BRXgSHufh4aOS4QC4aBBD9aCvtZB2BOL
	yBdXC/i/GdAEZ4S8vfARWwacANBP+y/GHMKfjv0NSJWIprWamgF1FNa4s9YyyID94JHq
	7teDg+bG4QWhtDSuLpzrJrq/bNkKEKFl7H7h9LAGtWI5cWPBBVpanpjaghv9sHwgVp9C
	XJuw==
X-Gm-Message-State: AOAM531G6/jYnqnCCd3ttJaaVO0uBfnv4RmWogRcyXWLHVgLa0zJ3b7q
	MfzggQ1+MnXtgqKqJLb0NRytKw==
X-Google-Smtp-Source: ABdhPJzhDkBd+v2HhIuSSFxe7q/gCCFa7piTUeuWx+Lf/VxFezQOIFJlwEWQjiaOfJj4rq7XTMPNMA==
X-Received: by 2002:a05:620a:e10:: with SMTP id
	y16mr9042205qkm.375.1617292811103; 
	Thu, 01 Apr 2021 09:00:11 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:9738])
	by smtp.gmail.com with ESMTPSA id
	z188sm4335793qkb.40.2021.04.01.09.00.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 01 Apr 2021 09:00:10 -0700 (PDT)
Date: Thu, 1 Apr 2021 12:00:08 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <YGXuCMfBWL51TVu3@cmpxchg.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
	<20210322184744.GU1719932@casper.infradead.org>
	<YFqH3B80Gn8pcPqB@cmpxchg.org>
	<20210324062421.GQ1719932@casper.infradead.org>
	<YF4eX/VBPLmontA+@cmpxchg.org>
	<20210329165832.GG351017@casper.infradead.org>
	<YGN8biqigvPP0SGN@cmpxchg.org>
	<20210330210929.GR351017@casper.infradead.org>
	<YGVUobKUMUtEy1PS@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YGVUobKUMUtEy1PS@zeniv-ca.linux.org.uk>
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v5 00/27] Memory Folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 01, 2021 at 05:05:37AM +0000, Al Viro wrote:
> On Tue, Mar 30, 2021 at 10:09:29PM +0100, Matthew Wilcox wrote:
> 
> > That's a very Intel-centric way of looking at it.  Other architectures
> > support a multitude of page sizes, from the insane ia64 (4k, 8k, 16k, then
> > every power of four up to 4GB) to more reasonable options like (4k, 32k,
> > 256k, 2M, 16M, 128M).  But we (in software) shouldn't constrain ourselves
> > to thinking in terms of what the hardware currently supports.  Google
> > have data showing that for their workloads, 32kB is the goldilocks size.
> > I'm sure for some workloads, it's much higher and for others it's lower.
> > But for almost no workload is 4kB the right choice any more, and probably
> > hasn't been since the late 90s.
> 
> Out of curiosity I looked at the distribution of file sizes in the
> kernel tree:
> 71455 files total
> 0--4Kb		36702
> 4--8Kb		11820
> 8--16Kb		10066
> 16--32Kb	6984
> 32--64Kb	3804
> 64--128Kb	1498
> 128--256Kb	393
> 256--512Kb	108
> 512Kb--1Mb	35
> 1--2Mb		25
> 2--4Mb		5
> 4--6Mb		7
> 6--8Mb		4
> 12Mb		2 
> 14Mb		1
> 16Mb		1
> 
> ... incidentally, everything bigger than 1.2Mb lives^Wshambles under
> drivers/gpu/drm/amd/include/asic_reg/
> 
> Page size	Footprint
> 4Kb		1128Mb
> 8Kb		1324Mb
> 16Kb		1764Mb
> 32Kb		2739Mb
> 64Kb		4832Mb
> 128Kb		9191Mb
> 256Kb		18062Mb
> 512Kb		35883Mb
> 1Mb		71570Mb
> 2Mb		142958Mb
> 
> So for kernel builds (as well as grep over the tree, etc.) uniform 2Mb pages
> would be... interesting.

Right, I don't see us getting rid of 4k cache entries anytime
soon. Even 32k pages would double the footprint here.

The issue is just that at the other end of the spectrum we have IO
devices that do 10GB/s, which corresponds to 2.6 million pages per
second. At such data rates we are currently CPU-limited because of the
pure transaction overhead in page reclaim. Workloads like this tend to
use much larger files, and would benefit from a larger paging unit.

Likewise, most production workloads in cloud servers have enormous
anonymous regions and large executables that greatly benefit from
fewer page table levels and bigger TLB entries.

Today, fragmentation prevents the page allocator from producing 2MB
blocks at a satisfactory rate and allocation latency. It's not
feasible to allocate 2M inside page faults for example; getting huge
page coverage for the page cache will be even more difficult.

I'm not saying we should get rid of 4k cache entries. Rather, I'm
wondering out loud whether longer-term we'd want to change the default
page size to 2M, and implement the 4k cache entries, which we clearly
continue to need, with a slab style allocator on top. The idea being
that it'll do a better job at grouping cache entries with other cache
entries of a similar lifetime than the untyped page allocator does
naturally, and so make fragmentation a whole lot more manageable.

(I'm using x86 page sizes as examples because they matter to me. But
there is an architecture independent discrepancy between the smallest
cache entries we must continue to support, and larger blocks / huge
pages that we increasingly rely on as first class pages.)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

