Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F03EA2B7F3B
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 Nov 2020 15:17:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-E81ipfUSNLG-zCmErnhR6A-1; Wed, 18 Nov 2020 09:17:20 -0500
X-MC-Unique: E81ipfUSNLG-zCmErnhR6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 837AF10051A8;
	Wed, 18 Nov 2020 14:17:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4252C1002382;
	Wed, 18 Nov 2020 14:17:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EF9618095C9;
	Wed, 18 Nov 2020 14:17:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIEHDbh013106 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 09:17:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 43BF7111C4AA; Wed, 18 Nov 2020 14:17:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F879111C4BD
	for <linux-cachefs@redhat.com>; Wed, 18 Nov 2020 14:17:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1443801224
	for <linux-cachefs@redhat.com>; Wed, 18 Nov 2020 14:17:10 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-209-Vcs-FMmDNxynUO5wL-yx_Q-1; Wed, 18 Nov 2020 09:17:05 -0500
X-MC-Unique: Vcs-FMmDNxynUO5wL-yx_Q-1
Received: by nautica.notk.org (Postfix, from userid 1001)
	id 294A5C009; Wed, 18 Nov 2020 15:17:04 +0100 (CET)
Date: Wed, 18 Nov 2020 15:16:49 +0100
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20201118141649.GA14211@nautica>
References: <20201118124826.GA17850@nautica>
	<1514086.1605697347@warthog.procyon.org.uk>
	<1561011.1605706707@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1561011.1605706707@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH] 9p: Convert to new fscache API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells wrote on Wed, Nov 18, 2020:
> > What's the current schedule/plan for the fscache branch merging? Will
> > you be trying this merge window next month?
> 
> That's the aim.  We have afs, ceph and nfs are about ready; I've had a go at
> doing the 9p conversion, which I'll have to leave to you now, I think, and am
> having a poke at cifs.

Ok, will try to polish it up by then.
Worst case as discussed is to have fscache be an alias for cache=loose
until it's ready but with the first version you gave me it hopefully
won't be needed.

> > >  (*) I have made an assumption that 9p_client_read() and write can handle I/Os
> > >      larger than a page.  If this is not the case, v9fs_req_ops will need
> > >      clamp_length() implementing.
> > 
> > There's a max driven by the client's msize
> 
> The netfs read helpers provide you with a couple of options here:
> 
>  (1) You can use ->clamp_length() to do multiple slices of at least 1 byte
>      each.  The assumption being that these represent parallel operations.  A
>      new subreq will be generated for each slice.
> 
>  (2) You can go with large slices that are larger than msize, and just read
>      part of it with each read.  After reading, the netfs helper will keep
>      calling you again to read some more of it, provided you didn't return an
>      error and you at least read something.

clamp_length looks good for that, if we can get parallel requests out
it'll all come back faster.

> > (client->msize - P9_IOHDRSZ ; unfortunately msize is just guaranted to be >=
> > 4k so that means the actual IO size would be smaller in that case even if
> > that's not intended to be common)
> 
> Does that mean you might be limited to reads of less than PAGE_SIZE on some
> systems (ppc64 for example)?  This isn't a problem for the read helper, but
> might be an issue for writing from THPs.

Quite likely, the actual used size varies depending on the backend (64k
for tcp, 500k for virtio) but can definietly be less than PAGE_SIZE.

I take it the read helper would just iterate as long as there's data
still required to read, writing from THPs wouldn't do that?


> > >  (*) The cache needs to be invalidated if a 3rd-party change happens, but I
> > >      haven't done that.
> > 
> > There's no concurrent access logic in 9p as far as I'm aware (like NFS
> > does if the mtime changes for example), so I assume we can keep ignoring
> > this.
> 
> By that, I presume you mean concurrent accesses are just not permitted?

Sorry - I meant coherency if files are modified on multiple clients
isn't guaranted - there are voluntary locks but that's about it, nothing
will detect e.g. remote file size modifications.
Concurrency on a given client works fine and should be used if possible.

-- 
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

