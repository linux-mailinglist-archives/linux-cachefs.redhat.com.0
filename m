Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AEB47E04
	for <lists+linux-cachefs@lfdr.de>; Mon, 17 Jun 2019 11:14:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BC8B30872D2;
	Mon, 17 Jun 2019 09:14:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A719210246F5;
	Mon, 17 Jun 2019 09:14:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E43D124AFA;
	Mon, 17 Jun 2019 09:13:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5H9Doqu014633 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 05:13:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 906E310246F2; Mon, 17 Jun 2019 09:13:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-120-109.rdu2.redhat.com
	[10.10.120.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4DE810246F4;
	Mon, 17 Jun 2019 09:13:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190617070848.D1A8446400A2@webmail.sinamail.sina.com.cn>
References: <20190617070848.D1A8446400A2@webmail.sinamail.sina.com.cn>
To: yangyuqi@sina.com
MIME-Version: 1.0
Content-ID: <1783.1560762826.1@warthog.procyon.org.uk>
Date: Mon, 17 Jun 2019 10:13:46 +0100
Message-ID: <1784.1560762826@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5H9Doqu014633
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] About r FS-Cache
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 17 Jun 2019 09:14:08 +0000 (UTC)

<yangyuqi@sina.com> wrote:

> Hello Doctor David,

Sadly, I haven't managed to get a PhD yet.

> I'm a developer for NFS at Android OS, I want transplant FS-Cache to Android,
> I had look for source code at https://people.redhat.com/~dhowells/fscache/ ,
> I found only cachefilesd source code in the website,

Yep.  That's the userspace side of cachefiles.  The git tree for it is here:

https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/cachefilesd.git

> there not include fscache(kernel part).  So, where have the fscache code can
> let me to transplant?

It's been in the upstream Linux kernel for over a decade.  Look in fs/fscache/
fs/cachefiles/ and Documentation/filesystems/caching/

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
