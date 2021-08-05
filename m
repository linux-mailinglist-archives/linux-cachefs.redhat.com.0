Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BFB5F3E1BB5
	for <lists+linux-cachefs@lfdr.de>; Thu,  5 Aug 2021 20:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628189453;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gxCLGVNS+Z8u+MZM4nFcnLlKhpOlyDdOYxaPxmm135k=;
	b=AqLhHu/cEFmdcODrvCRXivzCxlUuvABx3qD29McaEcMl34LcB9DcjIpKnVuJfL3G0DLUzm
	pO7XrjNh7WTPieWnjK1p9e+Kn+yFW1Kh13YonQobtzt+pCdU4g08vf7cT7eDGWzSLAOPYV
	oyTt/+wQV59OLoK10GLBfhhrXyhrGzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-7eDJBc3JOJOyC0_X335l3w-1; Thu, 05 Aug 2021 14:50:52 -0400
X-MC-Unique: 7eDJBc3JOJOyC0_X335l3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BFA88799F7;
	Thu,  5 Aug 2021 18:50:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9D361981C;
	Thu,  5 Aug 2021 18:50:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB1A0181A863;
	Thu,  5 Aug 2021 18:50:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 175IoiFm016303 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 5 Aug 2021 14:50:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE83920BDB2B; Thu,  5 Aug 2021 18:50:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B79F020BDB26
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 18:50:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 716F68007B1
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 18:50:34 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-390-h-VFHgQwM3mtw7Ui9fKsTA-1; Thu, 05 Aug 2021 14:50:33 -0400
X-MC-Unique: h-VFHgQwM3mtw7Ui9fKsTA-1
Received: by mail-qk1-f199.google.com with SMTP id
	y3-20020ae9f4030000b02903b916ae903fso4782545qkl.6
	for <linux-cachefs@redhat.com>; Thu, 05 Aug 2021 11:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IiYjOVol2JvYBzSm9nmbOsFi1gSlVR+sNt5v+Iro+eM=;
	b=hu/hzEUG+SmH3FnZQh8RXP3gkZQDg7Zjc0zXLwo3pkOtzHV87ypYfP5e0f8qLFWQ3N
	KCsPrW1Tj3AZP+IHAHyYKcT++MeT4+z4u5N6vYih41HRzztbTmcM0+4EUrdv9WRTrquQ
	9IQ2pEjnbLFsT1cQhJNQ9l3l0BPBrPkXyylvVKw0xJh2xYf1+7oNjHTaTC09wLd0PQDF
	nYssn7w5R3H4xeTatuHQQB2YA6XSlPIzc9eNWkVaQFeKJQHBTTEZF4fltVYuE7rFg/sO
	uYUeg0tHw180deatolaJWCXrHwWLXFi0V720vygwMgyBOwho8wK6OMv9TMclCQivnWD3
	SUdw==
X-Gm-Message-State: AOAM5336OunRovbFBeQvATNExQnu8hS4G6rlkA7GM5A2pUq8w4LnICWh
	7/TaguUshnnFy7DLAybxnkcuqrNBb0BAQ1D5HpPIGZOB7JcvugwaT7GDbCRPRIlhJci4OQdavz3
	spY+htiLmfH+vre5kJEZk5A==
X-Received: by 2002:a05:620a:b44:: with SMTP id
	x4mr4723773qkg.11.1628189432775; 
	Thu, 05 Aug 2021 11:50:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCNAmptp/YxuNLEFQ2GKThqZsDaw/EkAl6/uzN/fIMPdEnuhdMjnc4Ro9mfYivPJI45LPC9Q==
X-Received: by 2002:a05:620a:b44:: with SMTP id
	x4mr4723755qkg.11.1628189432545; 
	Thu, 05 Aug 2021 11:50:32 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	c190sm3509913qkg.46.2021.08.05.11.50.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Aug 2021 11:50:32 -0700 (PDT)
Message-ID: <90a2a17aeae0447793496426d21794a3b0f7c197.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, Anna Schumaker
	<anna.schumaker@netapp.com>, Trond Myklebust
	<trond.myklebust@hammerspace.com>, Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>, Mike Marshall
	<hubcap@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 05 Aug 2021 14:50:30 -0400
In-Reply-To: <1219713.1628181333@warthog.procyon.org.uk>
References: <YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org, devel@lists.orangefs.org
Subject: Re: [Linux-cachefs] Canvassing for network filesystem write size vs
	page size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-05 at 17:35 +0100, David Howells wrote:
> With Willy's upcoming folio changes, from a filesystem point of view, we're
> going to be looking at folios instead of pages, where:
> 
>  - a folio is a contiguous collection of pages;
> 
>  - each page in the folio might be standard PAGE_SIZE page (4K or 64K, say) or
>    a huge pages (say 2M each);
> 
>  - a folio has one dirty flag and one writeback flag that applies to all
>    constituent pages;
> 
>  - a complete folio currently is limited to PMD_SIZE or order 8, but could
>    theoretically go up to about 2GiB before various integer fields have to be
>    modified (not to mention the memory allocator).
> 
> Willy is arguing that network filesystems should, except in certain very
> special situations (eg. O_SYNC), only write whole folios (limited to EOF).
> 
> Some network filesystems, however, currently keep track of which byte ranges
> are modified within a dirty page (AFS does; NFS seems to also) and only write
> out the modified data.
> 
> Also, there are limits to the maximum RPC payload sizes, so writing back large
> pages may necessitate multiple writes, possibly to multiple servers.
> 
> What I'm trying to do is collate each network filesystem's properties (I'm
> including FUSE in that).
> 
> So we have the following filesystems:
> 
>  Plan9
>  - Doesn't track bytes
>  - Only writes single pages
> 
>  AFS
>  - Max RPC payload theoretically ~5.5 TiB (OpenAFS), ~16EiB (Auristor/kAFS)
>  - kAFS (Linux kernel)
>    - Tracks bytes, only writes back what changed
>    - Writes from up to 65535 contiguous pages.
>  - OpenAFS/Auristor (UNIX/Linux)
>    - Deal with cache-sized blocks (configurable, but something from 8K to 2M),
>      reads and writes in these blocks
>  - OpenAFS/Auristor (Windows)
>    - Track bytes, write back only what changed
> 
>  Ceph
>  - File divided into objects (typically 2MiB in size), which may be scattered
>    over multiple servers.

The default is 4M in modern cephfs clusters, but the rest is correct.

>  - Max RPC size is therefore object size.
>  - Doesn't track bytes.
> 
>  CIFS/SMB
>  - Writes back just changed bytes immediately under some circumstances

cifs.ko can also just do writes to specific byte ranges synchronously
when it doesn't have the ability to use the cache (i.e. no oplock or
lease). CephFS also does this when it doesn't have the necessary
capabilities (aka caps) to use the pagecache.

If we want to add infrastructure for netfs writeback, then it would be
nice to consider similar infrastructure to handle those cases as well.

>  - Doesn't track bytes and writes back whole pages otherwise.
>  - SMB3 has a max RPC size of 16MiB, with a default of 4MiB
> 
>  FUSE
>  - Doesn't track bytes.
>  - Max 'RPC' size of 256 pages (I think).
> 
>  NFS
>  - Tracks modified bytes within a page.
>  - Max RPC size of 1MiB.
>  - Files may be constructed of objects scattered over different servers.
> 
>  OrangeFS
>  - Doesn't track bytes.
>  - Multipage writes possible.
> 
> If you could help me fill in the gaps, that would be great.


-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

