Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 116272332A9
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 15:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596114529;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cYmMEwlOedjAkvI58lAFwqhtBa3tW7vZTwV0kniaStI=;
	b=Z2vtULrhGqcQx7zEtDPOJf4ytZdpEMjZ/qdabl/v69LTNAAJmJ/q//L+mqAVCQKNQS+tF3
	eBdRC/AI9hoZXgGC4sjilNHWT0KfiOSkRhuzKdXVt/kVKF0vkuc6ORjzN1I7nSDRN6AxKf
	A/dDIeP411E8CZPqL/2iKNPghlnOY4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-phg1mY8yNRytin38B0Pp1w-1; Thu, 30 Jul 2020 09:08:47 -0400
X-MC-Unique: phg1mY8yNRytin38B0Pp1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37D66107ACCA;
	Thu, 30 Jul 2020 13:08:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A34A712F3;
	Thu, 30 Jul 2020 13:08:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1A679A0E2;
	Thu, 30 Jul 2020 13:08:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UD8drZ008415 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 09:08:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3281FA72D; Thu, 30 Jul 2020 13:08:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD60CFA73F
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 13:08:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95322185A797
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 13:08:36 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-142-JaSLmMjINZ6w3jm_Q3NtFw-1; Thu, 30 Jul 2020 09:08:34 -0400
X-MC-Unique: JaSLmMjINZ6w3jm_Q3NtFw-1
Received: by mail-qt1-f197.google.com with SMTP id w15so18454071qti.21
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 06:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gWaKeY39EULxcPQEMCGaeW0bHOFmCjPvx3LSrbbV7xY=;
	b=enFEzjTUlvabY9ko7wn6GyMo8BqvALMjaV1EkffR/QobhjoJkb2UNzd4Juad3hyksN
	33bXggmnj/GONG0FMW1HOui8npuAt4DvzIqb6NZGx9AYitclxWECQssYjFHlhQnTPM/0
	glj3Ryt98Ct8X3IQTlIgUQVGE8ek04F9Co0uuqYaBZ9p8+VIXjHBJt7GWbcinZUtHjNB
	5aGR8L1pKk3Ev6UDH+gfEq7ou2aJTZmtA0i5EhuUEVpfKAFDklF8EtD7FFuQhJNdVfFa
	et9x/YeL9KEvmDk0ACBP/3rKhPEUJ0CrMFJXntaH1ufqcWYtwopzo9dphiBvGBRddz+x
	dlsQ==
X-Gm-Message-State: AOAM532sZIsYWbeTP32uzT47bMFJq8MAV+DdxZjMceGDaZym6xu0j4mP
	lDcK8T1qfkIeBz7XCrQjHanx8zuf1v3TPSfymBs1vJzSfoowtY20skaI9ZYf7NXD3hn3ypeUpHd
	jr2lQ9Oh9c5KxtMaQra8Tyg==
X-Received: by 2002:ac8:454f:: with SMTP id z15mr2627668qtn.351.1596114514354; 
	Thu, 30 Jul 2020 06:08:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE3m4VK7ilMGfBwsUtRjmSKljYtJpn8E03df8J9j67dNo1Fgsoe+A7NDnW7aFB+gXKH74gBg==
X-Received: by 2002:ac8:454f:: with SMTP id z15mr2627612qtn.351.1596114513855; 
	Thu, 30 Jul 2020 06:08:33 -0700 (PDT)
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
	by smtp.gmail.com with ESMTPSA id 8sm4314260qkh.77.2020.07.30.06.08.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jul 2020 06:08:33 -0700 (PDT)
Message-ID: <2db05b3eb59bfb59688e7cb435c1b5f2096b8f8a.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, torvalds@linux-foundation.org
Date: Thu, 30 Jul 2020 09:08:32 -0400
In-Reply-To: <447452.1596109876@warthog.procyon.org.uk>
References: <447452.1596109876@warthog.procyon.org.uk>
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Anna
Subject: Re: [Linux-cachefs] Upcoming: fscache rewrite
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-30 at 12:51 +0100, David Howells wrote:
> Hi Linus, Trond/Anna, Steve, Eric,
> 
> I have an fscache rewrite that I'm tempted to put in for the next merge
> window:
> 
> 	https://lore.kernel.org/linux-fsdevel/159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk/
> 
> It improves the code by:
> 
>  (*) Ripping out the stuff that uses page cache snooping and kernel_write()
>      and using kiocb instead.  This gives multiple wins: uses async DIO rather
>      than snooping for updated pages and then copying them, less VM overhead.
> 
>  (*) Object management is also simplified, getting rid of the state machine
>      that was managing things and using a much simplified thread pool instead.
> 
>  (*) Object invalidation creates a tmpfile and diverts new activity to that so
>      that it doesn't have to synchronise in-flight ADIO.
> 
>  (*) Using a bitmap stored in an xattr rather than using bmap to find out if
>      a block is present in the cache.  Probing the backing filesystem's
>      metadata to find out is not reliable in modern extent-based filesystems
>      as them may insert or remove blocks of zeros.  Even SEEK_HOLE/SEEK_DATA
>      are problematic since they don't distinguish transparently inserted
>      bridging.
> 
> I've provided a read helper that handles ->readpage, ->readpages, and
> preparatory writes in ->write_begin.  Willy is looking at using this as a way
> to roll his new ->readahead op out into filesystems.  A good chunk of this
> will move into MM code.
> 
> The code is simpler, and this is nice too:
> 
>  67 files changed, 5947 insertions(+), 8294 deletions(-)
> 
> not including documentation changes, which I need to convert to rst format
> yet.  That removes a whole bunch more lines.
> 
> But there are reasons you might not want to take it yet:
> 
>  (1) It starts off by disabling fscache support in all the filesystems that
>      use it: afs, nfs, cifs, ceph and 9p.  I've taken care of afs, Dave
>      Wysochanski has patches for nfs:
> 
> 	https://lore.kernel.org/linux-nfs/1596031949-26793-1-git-send-email-dwysocha@redhat.com/
> 
>      but they haven't been reviewed by Trond or Anna yet, and Jeff Layton has
>      patches for ceph:
> 
> 	https://marc.info/?l=ceph-devel&m=159541538914631&w=2
> 
>      and I've briefly discussed cifs with Steve, but nothing has started there
>      yet.  9p I've not looked at yet.
> 
>      Now, if we're okay for going a kernel release with 4/5 filesystems with
>      caching disabled and then pushing the changes for individual filesystems
>      through their respective trees, it might be easier.
> 
>      Unfortunately, I wasn't able to get together with Trond and Anna at LSF
>      to discuss this.
> 
>  (2) The patched afs fs passed xfstests -g quick (unlike the upstream code
>      that oopses pretty quickly with caching enabled).  Dave and Jeff's nfs
>      and ceph code is getting close, but not quite there yet.


That was my experience on cephfs+fscache too -- it often crashed down in
the fscache code. I'd support the approach in (1) above -- put this in
soon and disable the caches in the filesystems. Then push the changes to
reenable it via fs-specific trees.

The ceph patch series is more or less ready. It passes all of the
xfstest "quick" group run (aside from a few expected failures on
cephfs).

The only real exception is generic/531, which seems to trigger OOM kills
in my testing. The test tries to create a ton of files and leak the file
descriptors. I tend to think that workload is pretty unusual, and given
that fscache was terribly unstable and crashed before, this is still a
marked improvement.

>  (3) Al has objections to the ITER_MAPPING iov_iter type that I added
> 
> 	https://lore.kernel.org/linux-fsdevel/20200719014436.GG2786714@ZenIV.linux.org.uk/
> 
>      but note that iov_iter_for_each_range() is not actually used by anything.
> 
>      However, Willy likes it and would prefer to make it ITER_XARRAY instead
>      as he might be able to use it in other places, though there's an issue
>      where I'm calling find_get_pages_contig() which takes a mapping (though
>      all it does is then get the xarray out of it).
> 
>      Instead I would have to use ITER_BVEC, which has quite a high overhead,
>      though it would mean that the RCU read lock wouldn't be necessary.  This
>      would require 1K of memory for every 256K block the cache wants to read;
>      for any read >1M, I'd have to use vmalloc() instead.
> 
>      I'd also prefer not to use ITER_BVEC because the offset and length are
>      superfluous here.  If ITER_MAPPING is not good, would it be possible to
>      have an ITER_PAGEARRAY that just takes a page array instead?  Or, even,
>      create a transient xarray?
> 
>  (4) The way object culling is managed needs overhauling too, but that's a
>      whole 'nother patchset.  We could wait till that's done too, but its lack
>      doesn't prevent what we have now being used.
> 
> Thoughts?
> 
> David
> 

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

