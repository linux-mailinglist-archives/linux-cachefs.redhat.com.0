Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 174253C80A6
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Jul 2021 10:48:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-IRYQ0wo-OPOESvbeiO7MGw-1; Wed, 14 Jul 2021 04:48:16 -0400
X-MC-Unique: IRYQ0wo-OPOESvbeiO7MGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45E37800050;
	Wed, 14 Jul 2021 08:48:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1F46100EB3E;
	Wed, 14 Jul 2021 08:48:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09F8B4E9F5;
	Wed, 14 Jul 2021 08:48:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16E2JVgV030219 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 22:19:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F45B200B676; Wed, 14 Jul 2021 02:19:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AB86200B670
	for <linux-cachefs@redhat.com>; Wed, 14 Jul 2021 02:19:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EDBC805F4A
	for <linux-cachefs@redhat.com>; Wed, 14 Jul 2021 02:19:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-571-a35j65mWPW-6gAtDT_PQBg-1;
	Tue, 13 Jul 2021 22:19:26 -0400
X-MC-Unique: a35j65mWPW-6gAtDT_PQBg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04B6161260;
	Wed, 14 Jul 2021 02:11:01 +0000 (UTC)
Date: Tue, 13 Jul 2021 19:11:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Howells <dhowells@redhat.com>
Message-Id: <20210713191101.b38013786e36286e78c9648c@linux-foundation.org>
In-Reply-To: <3398985.1626104609@warthog.procyon.org.uk>
References: <3398985.1626104609@warthog.procyon.org.uk>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 14 Jul 2021 04:48:05 -0400
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] Request for folios
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 12 Jul 2021 16:43:29 +0100 David Howells <dhowells@redhat.com> wrote:

> Hi Andrew,
> 
> Is it possible to get Willy's folios patchset - or at least the core of it -
> staged for the next merge window?  I'm working on improvements to the local
> filesystem caching code and the network filesystem support library and that
> involves a lot of dealing with pages - all of which will need to be converted
> to the folios stuff.  This has the potential to conflict with the changes
> Willy's patches make to filesystems.  Further, the folios patchset offers some
> facilities that make my changes a bit easier - and some changes that make
> things a bit more challenging (e.g. page size becoming variable).

It's about that time.  However there's a discussion at present which
might result in significant renamings, so I'll wait until that has
panned out.

> Also, is it possible to get the folios patchset in a stable public git branch
> that I can base my patches upon?

I guess Willy's tree, but I doubt if the folio patches will be reliably
stable for some time (a few weeks?)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

