Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AFEB83AC1CC
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Jun 2021 06:10:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-loh99I1-NKWmnVL1Z_CcPw-1; Fri, 18 Jun 2021 00:10:16 -0400
X-MC-Unique: loh99I1-NKWmnVL1Z_CcPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 380AB18D6A2F;
	Fri, 18 Jun 2021 04:10:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EE125C1A1;
	Fri, 18 Jun 2021 04:10:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 131861809CAD;
	Fri, 18 Jun 2021 04:10:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15I4A2IK018274 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 18 Jun 2021 00:10:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B27D11065664; Fri, 18 Jun 2021 04:10:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADE441065687
	for <linux-cachefs@redhat.com>; Fri, 18 Jun 2021 04:09:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62CCF811E9C
	for <linux-cachefs@redhat.com>; Fri, 18 Jun 2021 04:09:57 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-qTUPyncyM26Bz_nEt5ph2w-1; Fri, 18 Jun 2021 00:09:55 -0400
X-MC-Unique: qTUPyncyM26Bz_nEt5ph2w-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lu5Sa-009UL9-7S; Fri, 18 Jun 2021 03:46:24 +0000
Date: Fri, 18 Jun 2021 03:46:24 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Message-ID: <YMwXEAMxEgGADeiG@zeniv-ca.linux.org.uk>
References: <162391823192.1173366.9740514875196345746.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <162391823192.1173366.9740514875196345746.stgit@warthog.procyon.org.uk>
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
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v2 0/3] netfs,
	afs: Fix netfs_write_begin and THP handling
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

On Thu, Jun 17, 2021 at 09:23:51AM +0100, David Howells wrote:
> 
> Here are some patches to fix netfs_write_begin() and the handling of THPs in
> that and afs_write_begin/end() in the following ways:
> 
>  (1) Use offset_in_thp() rather than manually calculating the offset into
>      the page.
> 
>  (2) In the future, the len parameter may extend beyond the page allocated.
>      This is because the page allocation is deferred to write_begin() and
>      that gets to decide what size of THP to allocate.
> 
>  (3) In netfs_write_begin(), extract the decision about whether to skip a
>      page out to its own helper and have that clear around the region to be
>      written, but not clear that region.  This requires the filesystem to
>      patch it up afterwards if the hole doesn't get completely filled.
> 
>  (4) Due to (3), afs_write_end() now needs to handle short data write into
>      the page by generic_perform_write().  I've adopted an analogous
>      approach to ceph of just returning 0 in this case and letting the
>      caller go round again.

Series looks sane.  I'd like to hear about the thp-related plans in
more detail, but that's a separate story.

> I wonder if generic_perform_write() should pass in a flag indicating
> whether this is the first attempt or a second attempt at this, and on the
> second attempt we just completely prefill the page and just let the partial
> write stand - which we have to do if the page was already uptodate when we
> started.

Not really - we'll simply get a shorter chunk next time around (with
the patches in -next right now it'll be "the amount we'd actually
managed to copy this time around" in case ->write_begin() tells us
to take a hike), and that shorter chunk is what ->write_begin() will
see.  No need for the flags...

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

