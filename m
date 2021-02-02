Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 600B530CF31
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Feb 2021 23:42:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-2D06hrlqNTebJ-jNYVnN7Q-1; Tue, 02 Feb 2021 17:42:41 -0500
X-MC-Unique: 2D06hrlqNTebJ-jNYVnN7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E033100C610;
	Tue,  2 Feb 2021 22:42:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC435D749;
	Tue,  2 Feb 2021 22:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B17A18095CA;
	Tue,  2 Feb 2021 22:42:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112MgVPb025920 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 17:42:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6F35FEE399; Tue,  2 Feb 2021 22:42:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69825E77BD
	for <linux-cachefs@redhat.com>; Tue,  2 Feb 2021 22:42:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48E8D80027F
	for <linux-cachefs@redhat.com>; Tue,  2 Feb 2021 22:42:29 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-597-fAaWRLLEMJG0scunzZ9RMA-1; Tue, 02 Feb 2021 17:42:27 -0500
X-MC-Unique: fAaWRLLEMJG0scunzZ9RMA-1
Received: by nautica.notk.org (Postfix, from userid 108)
	id 9742AC01C; Tue,  2 Feb 2021 23:37:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from tyr.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTP id 87D1CC01C;
	Tue,  2 Feb 2021 23:37:00 +0100 (CET)
Received: from tyr.codewreck.org (localhost [127.0.0.1])
	by tyr.codewreck.org (Postfix) with SMTP id 43C2D28076C;
	Wed,  3 Feb 2021 07:36:59 +0900 (JST)
Received: (from asmadeus@codewreck.org)
	by tyr.codewreck.org (mini_sendmail/1.3.9 19Oct2015);
	Wed, 03 Feb 2021 07:36:59 JST (sender asmadeus@tyr.codewreck.org)
Date: Wed, 3 Feb 2021 07:36:44 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210202223644.GA27614@tyr>
References: <241017.1612263863@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <241017.1612263863@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH] 9p: Convert to cut-down fscache I/O API
	rewrite
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

David Howells wrote on Tue, Feb 02, 2021 at 11:04:23AM +0000:
> Here's a draft of a patch to convert 9P to use the cut-down part of the
> fscache I/O API rewrite (I've removed all the cookie and object state machine
> changes for now).  It compiles, but I've no way to test it.  This is built on
> top of my fscache-netfs-lib branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-netfs-lib

Thanks for going the extra mile with all this, it's appreciated!

> I'm hoping to ask Linus to pull the netfs lib, afs and ceph changes in the
> next merge window.
> 
> Would you be able to give it a whirl?

I'm afraid I won't have much time to give for the next merge window (in
roughly 2-4 weeks iiuc)
I can probably find some time to run very basic tests from my usual
setup but testing actual fscache capabilities will take more time and
I'm quite short right now -- I honestly have no idea if anyone uses
fscache or if it's even working right now so I'd rather take a moment to
test it properly before/after, and it's time I don't have right now.


OTOH I'd support getting the netfs lib in as planned this merge window,
and I'll definitely take the time to test this patch into my tree before
the next one in ~3months.
I think the whole point of the rework you've done is we can do things
more smoothly and there is no reason to rush it anymore, having the new
lib get tested through afs/ceph in the real world can only be reassuring
for other filesystems.

Cheers,
-- 
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

