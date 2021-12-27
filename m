Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 338EA47F98C
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 01:20:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-XtkGuti4O3CswaAtETBRiQ-1; Sun, 26 Dec 2021 19:20:54 -0500
X-MC-Unique: XtkGuti4O3CswaAtETBRiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49622102C854;
	Mon, 27 Dec 2021 00:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06EC870D39;
	Mon, 27 Dec 2021 00:20:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 490711809CB8;
	Mon, 27 Dec 2021 00:20:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BR0KcjG024347 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 26 Dec 2021 19:20:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2B8071410F38; Mon, 27 Dec 2021 00:20:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26019140EBFD
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 00:20:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CFDC3C02B4C
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 00:20:38 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-448-k80ClIMiMW29KJF6MExtdA-1; Sun, 26 Dec 2021 19:20:34 -0500
X-MC-Unique: k80ClIMiMW29KJF6MExtdA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CC6B2B80E65;
	Mon, 27 Dec 2021 00:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC51C36AE9;
	Mon, 27 Dec 2021 00:20:31 +0000 (UTC)
Date: Sun, 26 Dec 2021 16:20:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-Id: <20211226162030.fc5340c2278c95342690467d@linux-foundation.org>
In-Reply-To: <YcS8rc64cVIckeW0@linutronix.de>
References: <20211223163500.2625491-1-bigeasy@linutronix.de>
	<901885.1640279829@warthog.procyon.org.uk>
	<YcS8rc64cVIckeW0@linutronix.de>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
Cc: Gregor Beck <gregor.beck@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [Linux-cachefs] [PATCH REPOST REPOST v2] fscache: Use only one
 fscache_object_cong_wait.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 23 Dec 2021 19:15:09 +0100 Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> On 2021-12-23 17:17:09 [+0000], David Howells wrote:
> > Thanks, but this is gone in the upcoming fscache rewrite.  I'm hoping that
> > will get in the next merge window.
> 
> Yes, I noticed that. What about current tree, v5.16-rc6 and less?
> Shouldn't this be addressed?

If the bug is serious enough to justify a -stable backport then yes, we
should merge a fix such as this ahead of the fscache rewrite, so we
have something suitable for backporting.

Is the bug serious enough?

Or is the bug in a not-yet-noticed state?  In other words, is it
possible that four years from now, someone will hit this bug in a
5.15-based kernel and will then wish we'd backported a fix?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

