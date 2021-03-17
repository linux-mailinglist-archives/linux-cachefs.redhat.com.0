Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3E833EEFD
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Mar 2021 12:00:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-T_DD8MXTPumVdz6nnJ709g-1; Wed, 17 Mar 2021 07:00:47 -0400
X-MC-Unique: T_DD8MXTPumVdz6nnJ709g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7388D80F05B;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E046362A6F;
	Wed, 17 Mar 2021 11:00:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90D9C1809C84;
	Wed, 17 Mar 2021 11:00:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12H2CT1B005088 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 22:12:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADFE76CA9B; Wed, 17 Mar 2021 02:12:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A752A2ED65
	for <linux-cachefs@redhat.com>; Wed, 17 Mar 2021 02:12:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BD2280A0B0
	for <linux-cachefs@redhat.com>; Wed, 17 Mar 2021 02:12:27 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
	[209.85.219.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-383-8K1MQlEhOUq_g44I_6p_fw-1; Tue, 16 Mar 2021 22:12:24 -0400
X-MC-Unique: 8K1MQlEhOUq_g44I_6p_fw-1
Received: by mail-qv1-f52.google.com with SMTP id d10so701348qve.7
	for <linux-cachefs@redhat.com>; Tue, 16 Mar 2021 19:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KA0cQX0H+fedUmZSqotKHkFt9nfBS2lV4mSDduYC1Vo=;
	b=SYI3Aoz87pz3XGY0uoxBomt2xc5JZgrgha/jh06DlDu6lHqfthxEvXmbSMEwtSziDO
	Gefv6uPuPOATJomNmSBqu1KBnz2J/5Ml5krllbp5n853u64XdlK5KBMSfgjn6A5a8j3Z
	eX2AICQh7kJJApn6a+X61WkGt8oAOLTwpJCjWQoe32FRc85WT3u68qsWbzyE7AeI1nB/
	7bZm3fbt5RXYQmobMagxNF16NqjxY517Vka9+qASvd9PhqREnPVwlPTzEkF0E2iwfMkn
	YccUd/HPrO1Aj9kDqndmjZYN86QAddvbAOpG97Y2Uh3jifS9I8tLhorsnCiLsaE41QeO
	FPRg==
X-Gm-Message-State: AOAM531mcZEM5WtWyzSbgmU2/MD9jOjKvzNVCEmQEnMlJyW/HgnbKxW/
	lDI8GMddTbN5aMw3966/NR/1Dg==
X-Google-Smtp-Source: ABdhPJyCVi9KcQuRC+jk9afKmHcOxIGMxGHzjm2jLRzMICkswTbEAhqzEZ42z+xpCoNkmkSraZlwfQ==
X-Received: by 2002:a05:6214:1744:: with SMTP id
	dc4mr2746704qvb.40.1615947143864; 
	Tue, 16 Mar 2021 19:12:23 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com.
	[174.109.172.136]) by smtp.gmail.com with ESMTPSA id
	r3sm16393336qkm.129.2021.03.16.19.12.22
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 16 Mar 2021 19:12:23 -0700 (PDT)
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>
References: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<20210316190707.GD3420@casper.infradead.org>
	<CAHk-=wjSGsRj7xwhSMQ6dAQiz53xA39pOG+XA_WeTgwBBu4uqg@mail.gmail.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <887b9eb7-2764-3659-d0bf-6a034a031618@toxicpanda.com>
Date: Tue, 16 Mar 2021 22:12:21 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjSGsRj7xwhSMQ6dAQiz53xA39pOG+XA_WeTgwBBu4uqg@mail.gmail.com>
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
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 3/16/21 8:43 PM, Linus Torvalds wrote:
> [ Adding btrfs people explicitly, maybe they see this on the fs-devel
> list, but maybe they don't react .. ]
> 
> On Tue, Mar 16, 2021 at 12:07 PM Matthew Wilcox <willy@infradead.org> wrote:
>>
>> This isn't a problem with this patch per se, but I'm concerned about
>> private2 and expected page refcounts.
> 
> Ugh. You are very right.
> 
> It would be good to just change the rules - I get the feeling nobody
> actually depended on them anyway because they were _so_ esoteric.
> 
>> static inline int is_page_cache_freeable(struct page *page)
>> {
>>          /*
>>           * A freeable page cache page is referenced only by the caller
>>           * that isolated the page, the page cache and optional buffer
>>           * heads at page->private.
>>           */
>>          int page_cache_pins = thp_nr_pages(page);
>>          return page_count(page) - page_has_private(page) == 1 + page_cache_pins;
> 
> You're right, that "page_has_private()" is really really nasty.
> 
> The comment is, I think, the traditional usage case, which used to be
> about page->buffers. Obviously these days it is now about
> page->private with PG_private set, pointing to buffers
> (attach_page_private() and detach_page_private()).
> 
> But as you point out:
> 
>> #define PAGE_FLAGS_PRIVATE                              \
>>          (1UL << PG_private | 1UL << PG_private_2)
>>
>> So ... a page with both flags cleared should have a refcount of N.
>> A page with one or both flags set should have a refcount of N+1.
> 
> Could we just remove the PG_private_2 thing in this context entirely,
> and make the rule be that
> 
>   (a) PG_private means that you have some local private data in
> page->private, and that's all that matters for the "freeable" thing.
> 
>   (b) PG_private_2 does *not* have the same meaning, and has no bearing
> on freeability (and only the refcount matters)
> 
> I _)think_ the btrfs behavior is to only use PagePrivate2() when it
> has a reference to the page, so btrfs doesn't care?
> 
> I think fscache is already happy to take the page count when using
> PG_private_2 for locking, exactly because I didn't want to have any
> confusion about lifetimes. But this "page_has_private()" math ends up
> meaning it's confusing anyway.
> 
> btrfs people? What are the semantics for PG_private_2? Is it just a
> flag, and you really don't want it to have anything to do with any
> page lifetime decisions? Or?
> 

Yeah it's just a flag, we use it to tell that the page is part of a range that 
has been allocated for IO.  The lifetime of the page is independent of the page, 
but is generally either dirty or under writeback, so either it goes through 
truncate and we clear PagePrivate2 there, or it actually goes through IO and is 
cleared before we drop the page in our endio.  We _always_ have PG_private set 
on the page as long as we own it, and PG_private_2 is only set in this IO 
related context, so we're safe there because of the rules around 
PG_dirty/PG_writeback.  We don't need it to have an extra ref for it being set. 
  Thanks,

Josef

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

