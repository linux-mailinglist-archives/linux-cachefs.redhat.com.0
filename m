Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4251048319C
	for <lists+linux-cachefs@lfdr.de>; Mon,  3 Jan 2022 14:54:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-WgyFFsGaPZCoiDMuQaERdA-1; Mon, 03 Jan 2022 08:54:51 -0500
X-MC-Unique: WgyFFsGaPZCoiDMuQaERdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62B1F363A4;
	Mon,  3 Jan 2022 13:54:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55CBD107A435;
	Mon,  3 Jan 2022 13:54:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 189804BB7C;
	Mon,  3 Jan 2022 13:54:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 203DscT9017437 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 3 Jan 2022 08:54:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 459FF492CA9; Mon,  3 Jan 2022 13:54:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FAC3492CA6
	for <linux-cachefs@redhat.com>; Mon,  3 Jan 2022 13:54:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25CD4185A7B4
	for <linux-cachefs@redhat.com>; Mon,  3 Jan 2022 13:54:38 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-474-emp1XIqbMKi0DLC47cLdeQ-1; Mon, 03 Jan 2022 08:54:34 -0500
X-MC-Unique: emp1XIqbMKi0DLC47cLdeQ-1
Date: Mon, 3 Jan 2022 14:54:31 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <YdMAF7vPKZTXE1FW@linutronix.de>
References: <20211223163500.2625491-1-bigeasy@linutronix.de>
	<901885.1640279829@warthog.procyon.org.uk>
	<YcS8rc64cVIckeW0@linutronix.de>
	<20211226162030.fc5340c2278c95342690467d@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20211226162030.fc5340c2278c95342690467d@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-12-26 16:20:30 [-0800], Andrew Morton wrote:
> On Thu, 23 Dec 2021 19:15:09 +0100 Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> 
> > On 2021-12-23 17:17:09 [+0000], David Howells wrote:
> > > Thanks, but this is gone in the upcoming fscache rewrite.  I'm hoping that
> > > will get in the next merge window.
> > 
> > Yes, I noticed that. What about current tree, v5.16-rc6 and less?
> > Shouldn't this be addressed?
> 
> If the bug is serious enough to justify a -stable backport then yes, we
> should merge a fix such as this ahead of the fscache rewrite, so we
> have something suitable for backporting.
> 
> Is the bug serious enough?
> 
> Or is the bug in a not-yet-noticed state?  In other words, is it
> possible that four years from now, someone will hit this bug in a
> 5.15-based kernel and will then wish we'd backported a fix?

I can't answer how serious it is but:
- with CONFIG_DEBUG_PREEMPT enabled there has to be a visible backtrace
  due this_cpu_ptr() usage.
- because of schedule_timeout(60 * HZ) there is no visible hang. It
  should be either woken up properly (via the waitqueue) or after a
  minute due to the timeout.

both things don't look good in general.

Sebastian

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

