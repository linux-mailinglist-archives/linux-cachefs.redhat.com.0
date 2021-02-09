Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 83A3731584F
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Feb 2021 22:10:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612905058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YNVV0vxxMHPrfKXZu1lVqHZuW+vTT8DDAJDFk8t8+LU=;
	b=BHeLxqaQ+8xb0yhRD+OBS9iSPbWRMgKORjCRU0BD6BlnUtv07yXkrVmndbVSyerffU2ocz
	gnnBPPUynmovbxxnQIJBXs0A8gwE9cki7CIDIseNBtxo8w1Zc0ZQLzgFgITIlaqFtJw90z
	VIHTxJs7ub17EXv9NFXypvMl6VfdRAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-OOBvdSSMNZuqFdLDIXEaXA-1; Tue, 09 Feb 2021 16:10:56 -0500
X-MC-Unique: OOBvdSSMNZuqFdLDIXEaXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 908D2192CC40;
	Tue,  9 Feb 2021 21:10:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C0910016FC;
	Tue,  9 Feb 2021 21:10:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D542918095CB;
	Tue,  9 Feb 2021 21:10:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119LAoix017239 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 16:10:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18A972BFE2; Tue,  9 Feb 2021 21:10:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDE796062F;
	Tue,  9 Feb 2021 21:10:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
References: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Tue, 09 Feb 2021 21:10:42 +0000
Message-ID: <617685.1612905042@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <617684.1612905042.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> The PG_fscache bit waiting functions are completely crazy. The comment
> about "this will wake up others" is actively wrong,

You mean this?

/**
 * unlock_page_fscache - Unlock a page pinned with PG_fscache
 * @page: The page
 *
 * Unlocks the page and wakes up sleepers in wait_on_page_fscache().  Also
 * wakes those waiting for the lock and writeback bits because the wakeup
 * mechanism is shared.  But that's OK - those sleepers will just go back to
 * sleep.
 */

Actually, you're right.  The wakeup check func is evaluated by the
waker-upper.  I can fix the comment with a patch.

> and the waiting function looks insane, because you're mixing the two names
> for "fscache" which makes the code look totally incomprehensible. Why would
> we wait for PF_fscache, when PG_private_2 was set? Yes, I know why, but the
> code looks entirely nonsensical.

IIRC someone insisted that I should make it a generic name and put the
accessor functions in the fscache headers (which means they aren't available
to core code), but I don't remember who (maybe Andrew? it was before mid-2007)
- kind of like PG_checked is an alias for PG_owner_priv_1.

I'd be quite happy to move the accessors for PG_fscache to the
linux/page-flags.h as that would simplify things.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

