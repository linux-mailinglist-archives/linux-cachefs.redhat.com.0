Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 357F43A6565
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Jun 2021 13:37:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-FWobYukRMe6NuUacYs88-w-1; Mon, 14 Jun 2021 07:37:15 -0400
X-MC-Unique: FWobYukRMe6NuUacYs88-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA95A19057A0;
	Mon, 14 Jun 2021 11:37:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFE225C22B;
	Mon, 14 Jun 2021 11:37:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8354A46F81;
	Mon, 14 Jun 2021 11:37:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15EBZhxr021292 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Jun 2021 07:35:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5D16216E1F0; Mon, 14 Jun 2021 11:35:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0FE4216E1EE
	for <linux-cachefs@redhat.com>; Mon, 14 Jun 2021 11:35:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3628D80D0E1
	for <linux-cachefs@redhat.com>; Mon, 14 Jun 2021 11:35:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-15-6GfpBsfBPDqFKC_v8Hhvig-1; 
	Mon, 14 Jun 2021 07:35:38 -0400
X-MC-Unique: 6GfpBsfBPDqFKC_v8Hhvig-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AD3061107;
	Mon, 14 Jun 2021 11:35:36 +0000 (UTC)
Message-ID: <4d1c9cf43d336b32dceabd2a28e9f68937c2e7a9.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Mon, 14 Jun 2021 07:35:35 -0400
In-Reply-To: <338981.1623665093@warthog.procyon.org.uk>
References: <20210613233345.113565-1-jlayton@kernel.org>
	<338981.1623665093@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34)
MIME-Version: 1.0
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
Cc: Andrew W Elble <aweits@rit.edu>, willy@infradead.org,
	linux-cachefs@redhat.com, pfmeec@rit.edu, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: fix test for whether we can skip
 read when writing beyond EOF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-06-14 at 11:04 +0100, David Howells wrote:
> Jeff Layton <jlayton@kernel.org> wrote:
> 
> > +/**
> > + * prep_noread_page - prep a page for writing without reading first
> 
> It's a static function, so I'm not sure it needs the kernel doc marker.
> 
> It also needs prefixing with "netfs_".
> 

I added the comment since the logic here is somewhat complex. It didn't
need to be a kerneldoc header, but I figured that didn't hurt anything.

> > +	/* pos beyond last page in the file */
> > +	if (index > ((i_size - 1) / thp_size(page)))
> > +		goto zero_out;
> 
> thp_size() is not a constant, so this gets you a DIV instruction.
> 

Ugh, ok.

> Why not:
> 
> 	if (page_offset(page) >= i_size)
> 

That doesn't handle THP's correctly. It's just a PAGE_SIZE shift.

> or maybe:
> 
> 	if (pos - offset >= i_size)
> 

That might work.

> > +	zero_user_segments(page, 0, offset, offset + len, thp_size(page));
> 
> If you're going to leave a hole in the file, this will break afs, so this
> patch needs to deal with that too (basically if copied < len, then the
> remainder needs clearing, give or take len being trimmed to the end of the
> page).  I can look at adding that.
> 

I think we have to contend with that in write_end. Basically if the copy
is short, then we probably want to pretend it was a zero length copy and
let generic_perform_write handle it as such. See commit b9de313cf05fe
where Al fixed some sketchy error handling in ceph_write_end along those
lines.

> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > > +	size_t offset = offset_in_page(pos);
> > 
> > offset_in_thp(page, pos);
> 
> I can make this change too.
> 

Thanks.

> (btw, can offset_in_thp() have it's second arg renamed to 'pos', not just 'p'?
>  'p' is normally used to indicate a pointer of some sort).
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

