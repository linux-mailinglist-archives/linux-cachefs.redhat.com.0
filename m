Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4F321594B
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Jul 2020 16:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594045445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xxfVs4HorG+R/Ia9D5wzxmTs88SH0dT104x/n36ycvo=;
	b=Ev6LG/1uECscbGov/XUUwbTUKIN5Nkt8omsP8I3NS7g95PKoEjGZWsL7kvNyOgG9eJix6N
	jJ+4Yd+dpVQujqOK41DMXHSwWLNJ4zAyRvBpM5Cnp/YbmQDrkyltcRi3Q7InYa4FTmppcs
	EQ2waCkT2I3qwMP468RdER+9rhP65xE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-jIqVNY7fNVCCcMHjZhX5Bg-1; Mon, 06 Jul 2020 10:24:03 -0400
X-MC-Unique: jIqVNY7fNVCCcMHjZhX5Bg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5B008014D4;
	Mon,  6 Jul 2020 14:24:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEE115C241;
	Mon,  6 Jul 2020 14:23:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 169616C9DA;
	Mon,  6 Jul 2020 14:23:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 066EN7DB019558 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Jul 2020 10:23:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA3AD60C87; Mon,  6 Jul 2020 14:23:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 592D060C84;
	Mon,  6 Jul 2020 14:23:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200705224324.16090-1-Jason@zx2c4.com>
References: <20200705224324.16090-1-Jason@zx2c4.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-ID: <2918158.1594045383.1@warthog.procyon.org.uk>
Date: Mon, 06 Jul 2020 15:23:03 +0100
Message-ID: <2918159.1594045383@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 066EN7DB019558
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] fscache: replace open-coded
	pr_warn_once() with actual call
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> There's no reason to open code this here, so instead replace it with
> pr_warn_once, which amounts to exactly the same thing.

Note that this file is set to be entirely deleted here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-iter

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

