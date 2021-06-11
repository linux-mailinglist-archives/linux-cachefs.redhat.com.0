Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E70353AAF67
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Jun 2021 11:14:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-nqpqEyNaNU6NIJNdhHyOdg-1; Thu, 17 Jun 2021 05:14:55 -0400
X-MC-Unique: nqpqEyNaNU6NIJNdhHyOdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9290100C664;
	Thu, 17 Jun 2021 09:14:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A19360C4A;
	Thu, 17 Jun 2021 09:14:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08A161809CAD;
	Thu, 17 Jun 2021 09:14:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BG5oZ3015363 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 12:05:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 84512105518F; Fri, 11 Jun 2021 16:05:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EB641065665
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 16:05:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0E9590DE2C
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 16:05:43 +0000 (UTC)
Received: from discipline.rit.edu (discipline.rit.edu [129.21.6.207]) by
	relay.mimecast.com with ESMTP id us-mta-284--T63RV-OPP2DydBMFbxhfg-1;
	Fri, 11 Jun 2021 12:05:41 -0400
X-MC-Unique: -T63RV-OPP2DydBMFbxhfg-1
Received: (qmail 46356 invoked by uid 501); 11 Jun 2021 15:59:00 -0000
From: Andrew W Elble <aweits@rit.edu>
To: David Howells <dhowells@redhat.com>
References: <YMN/PfW2t8e5M58m@casper.infradead.org>
	<a24c3c070c9fc3529a51f00f9ccc3d0abdd0b821.camel@kernel.org>
	<20200916173854.330265-1-jlayton@kernel.org>
	<20200916173854.330265-6-jlayton@kernel.org>
	<7817f98d3b2daafe113bf8290cc8c7adbb86fe99.camel@kernel.org>
	<m2h7i45vzl.fsf@discipline.rit.edu>
	<66264.1623424309@warthog.procyon.org.uk>
	<68477.1623425725@warthog.procyon.org.uk>
Date: Fri, 11 Jun 2021 11:59:00 -0400
In-Reply-To: <68477.1623425725@warthog.procyon.org.uk> (David Howells's
	message of "Fri, 11 Jun 2021 16:35:25 +0100")
Message-ID: <m2a6nw5r5n.fsf@discipline.rit.edu>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (berkeley-unix)
MIME-Version: 1.0
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
X-Mailman-Approved-At: Thu, 17 Jun 2021 05:14:39 -0400
Cc: pfmeec@rit.edu, ceph-devel@vger.kernel.org, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [Linux-cachefs] [PATCH 5/5] ceph: fold
	ceph_update_writeable_page into ceph_write_begin
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> writes:

> Matthew Wilcox <willy@infradead.org> wrote:
>
>> Yes.  I do that kind of thing in iomap.  What you're doing there looks
>> a bit like offset_in_folio(), but I don't understand the problem with
>> just checking pos against i_size directly.
>
> pos can be in the middle of a page.  If i_size is at, say, the same point in
> the middle of that page and the page isn't currently in the cache, then we'll
> just clear the entire page and not read the bottom part of it (ie. the bit
> prior to the EOF).
>
> It's odd, though, that xfstests doesn't catch this.

Some more details/information:

1.) The test is a really simple piece of code that essentially writes
    a incrementing number to a file on 'node a', while a 'tail -f'
    is run and exited multiple times on 'node b'. We haven't had much
    luck in this causing the problem when done on a single node
2.) ((pos & PAGE_MASK) >= i_size_read(inode)) ||' merely reflects the
    logic that was in place prior to 1cc1699070bd. Patching
    fs/ceph/addr.c with this does seem to eliminate the corruption.
    (We'll test with the patch Jeff posted here shortly)
3.) After finding all of this, I went upstream to look at fs/ceph/addr.c
    and discovered the move to leveraging fs/netfs/read_helper.c - we've
    only just compiled against git master and replicated the corruption
    there.


-- 
Andrew W. Elble
Infrastructure Engineer
Information and Technology Services
Rochester Institute of Technology
tel: (585)-475-2411 | aweits@rit.edu
PGP: BFAD 8461 4CCF DC95 DA2C B0EB 965B 082E 863E C912

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

