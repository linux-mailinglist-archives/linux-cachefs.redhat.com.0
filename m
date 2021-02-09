Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 764623157A1
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Feb 2021 21:22:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-P7CqncAVMG6PqO22wERprg-1; Tue, 09 Feb 2021 15:21:58 -0500
X-MC-Unique: P7CqncAVMG6PqO22wERprg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A010C73A2;
	Tue,  9 Feb 2021 20:21:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E3B119C59;
	Tue,  9 Feb 2021 20:21:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 309254E58E;
	Tue,  9 Feb 2021 20:21:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119KLoaH011883 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 15:21:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6662B2166B2B; Tue,  9 Feb 2021 20:21:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 611B92166B2A
	for <linux-cachefs@redhat.com>; Tue,  9 Feb 2021 20:21:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D691C802A69
	for <linux-cachefs@redhat.com>; Tue,  9 Feb 2021 20:21:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-302-fyEwHOkcMRq_ooZpIlX55Q-1; Tue, 09 Feb 2021 15:21:41 -0500
X-MC-Unique: fyEwHOkcMRq_ooZpIlX55Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1l9ZVu-007usA-1c; Tue, 09 Feb 2021 20:21:35 +0000
Date: Tue, 9 Feb 2021 20:21:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210209202134.GA308988@casper.infradead.org>
References: <591237.1612886997@warthog.procyon.org.uk>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
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
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache: I/O API modernisation and
 netfs helper library
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 09, 2021 at 11:06:41AM -0800, Linus Torvalds wrote:
> So I'm looking at this early, because I have more time now than I will
> have during the merge window, and honestly, your pull requests have
> been problematic in the past.

Thanks for looking at this early.

> The PG_fscache bit waiting functions are completely crazy. The comment
> about "this will wake up others" is actively wrong, and the waiting
> function looks insane, because you're mixing the two names for
> "fscache" which makes the code look totally incomprehensible. Why
> would we wait for PF_fscache, when PG_private_2 was set? Yes, I know
> why, but the code looks entirely nonsensical.

Yeah, I have trouble with the private2 vs fscache bit too.  I've been
trying to persuade David that he doesn't actually need an fscache
bit at all; he can just increment the page's refcount to prevent it
from being freed while he writes data to the cache.

> But the thing that makes me go "No, I won't pull this", is that it has
> all the same hallmark signs of trouble that I've complained about
> before: I see absolutely zero sign of "this has more developers
> involved".

I've been involved!  I really want to get rid of the address_space
readpages op.  The only remaining users are the filesystems which
use fscache and it's hard to convert them with the old infrastructure.
I'm not 100% convinced that the new infrastructure is good, but I am
convinced that it's better than the old infrastructure.

> There's not a single ack from a VM person for the VM changes. There's
> no sign that this isn't yet another "David Howells went off alone and
> did something that absolutely nobody else cared about".

I'm pretty bad about sending R-b for patches when I've only given them
a quick once-over.  I tend to only do it for patches that I've given an
appropriately deep amount of thought to (eg almost none for spelling
fixes and days for page cache related patches).  I'll see what I feel
comfortable with for this patchset.

> See my problem? I need to be convinced that this makes sense outside
> of your world, and it's not yet another thing that will cause problems
> down the line because nobody else really ever used it or cared about
> it until we hit a snag.

My major concern is that we haven't had any feedback from Trond or Anna.
I don't know if they're just too busy or if there's something else going
on, but it'd be nice to hear something.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

