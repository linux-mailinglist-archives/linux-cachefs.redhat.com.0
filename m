Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 139F12CE201
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 23:45:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-T8O1tNrRPmWCApO0h3JhFg-1; Thu, 03 Dec 2020 17:45:30 -0500
X-MC-Unique: T8O1tNrRPmWCApO0h3JhFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64BAC107ACE6;
	Thu,  3 Dec 2020 22:45:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5453A60C15;
	Thu,  3 Dec 2020 22:45:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D5064BB7B;
	Thu,  3 Dec 2020 22:45:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3MjQLF012629 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 17:45:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F00C6F11E4; Thu,  3 Dec 2020 22:45:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA038F11F7
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:45:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE785186E121
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:45:23 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-304-gCpQOwRZO-C694SztqOKQg-1;
	Thu, 03 Dec 2020 17:45:21 -0500
X-MC-Unique: gCpQOwRZO-C694SztqOKQg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id EFBFC6F4C; Thu,  3 Dec 2020 17:45:20 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org EFBFC6F4C
Date: Thu, 3 Dec 2020 17:45:20 -0500
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201203224520.GG27931@fieldses.org>
References: <20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"daire@dneg.com" <daire@dneg.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 03, 2020 at 09:34:26PM +0000, Trond Myklebust wrote:
> I've been wanting such a function for quite a while anyway in order to
> allow the client to detect state leaks (either due to soft timeouts, or
> due to reordered close/open operations).

One sure way to fix any state leaks is to reboot the server.  The server
throws everything away, the clients reclaim, all that's left is stuff
they still actually care about.

It's very disruptive.

But you could do a limited version of that: the server throws away the
state from one client (keeping the underlying locks on the exported
filesystem), lets the client go through its normal reclaim process, at
the end of that throws away anything that wasn't reclaimed.  The only
delay is to anyone trying to acquire new locks that conflict with that
set of locks, and only for as long as it takes for the one client to
reclaim.

?

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

