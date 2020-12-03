Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D35B92CE2A8
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 00:29:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-enS8l7xSP7aDiym-ffP1sQ-1; Thu, 03 Dec 2020 18:29:19 -0500
X-MC-Unique: enS8l7xSP7aDiym-ffP1sQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA87B107ACE3;
	Thu,  3 Dec 2020 23:29:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A1D5C1B4;
	Thu,  3 Dec 2020 23:29:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5C30180954D;
	Thu,  3 Dec 2020 23:29:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3NTESY017460 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 18:29:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3F5C0101B55B; Thu,  3 Dec 2020 23:29:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D13101F0AA
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 23:29:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0723D185A794
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 23:29:12 +0000 (UTC)
Received: from elasmtp-curtail.atl.sa.earthlink.net
	(elasmtp-curtail.atl.sa.earthlink.net [209.86.89.64]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-428-FWgmiBHINxG8UMI0MtiK6g-1;
	Thu, 03 Dec 2020 18:28:58 -0500
X-MC-Unique: FWgmiBHINxG8UMI0MtiK6g-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
	s=dk12062016; d=mindspring.com;
	b=b/mAHYPQs5849ih8S5Su/j57f/pULN7oEsgLa58O8LryxLlZtEVsUt+eIo4UaH4Iq72Fvsr15jfXTETPpSNUtndXk/SQHFqMmulIz29j+kRvmlGpHsrHwDCGlOdTbTTtpD00Wx+j/ujn9yE9MFrNkTwk0iRoQ1rObYUyNSJNUAm3aXEiP++rfiKgl5w2oyr8c5vWOwhfgBPPeRQz4gOSMpeRFMcFzXKbZMd6A4mSqxXj+u1UPffKxuHfw8vsPROjmPhqp1tZRzRF//yLHATwwgh0lz6SyAhF8m1xKtXmHPwymQQu2z1Frn0S2zTvD53T2vkU9u5UXZr7iqVzoPoscA==;
	h=Received:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index:X-ELNK-Trace:X-Originating-IP
Received: from [76.105.143.216] (helo=FRANKSTHINKPAD)
	by elasmtp-curtail.atl.sa.earthlink.net with esmtpa (Exim 4)
	(envelope-from <ffilzlnx@mindspring.com>)
	id 1kky1v-0006vq-NO; Thu, 03 Dec 2020 18:28:55 -0500
From: "Frank Filz" <ffilzlnx@mindspring.com>
To: <bfields@fieldses.org>, "'Trond Myklebust'" <trondmy@hammerspace.com>
References: <1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<20201203224520.GG27931@fieldses.org>
	<d88c69f90820bf631908cbe3d3ce34343ec672f1.camel@hammerspace.com>
	<20201203231655.GH27931@fieldses.org>
In-Reply-To: <20201203231655.GH27931@fieldses.org>
Date: Thu, 3 Dec 2020 15:28:54 -0800
Message-ID: <01ad01d6c9cc$11a6e530$34f4af90$@mindspring.com>
MIME-Version: 1.0
Thread-Index: AQGLCl71o/mllkcOM8ZTKfem/khTDAJjSqDGAjc9/isC5PHtZAIjFAJ1Aky2llQCn/rUrgIxRIQHAlROta8CY9Hk3wEcSJ+Bqcjbo/A=
X-ELNK-Trace: 136157f01908a8929c7f779228e2f6aeda0071232e20db4d00eb943d3b1620205d5b2bf3e3d4f8ac350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 76.105.143.216
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3NTESY017460
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com, daire@dneg.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Thu, Dec 03, 2020 at 10:53:26PM +0000, Trond Myklebust wrote:
> > On Thu, 2020-12-03 at 17:45 -0500, bfields@fieldses.org wrote:
> > > On Thu, Dec 03, 2020 at 09:34:26PM +0000, Trond Myklebust wrote:
> > > > I've been wanting such a function for quite a while anyway in
> > > > order to allow the client to detect state leaks (either due to
> > > > soft timeouts, or due to reordered close/open operations).
> > >
> > > One sure way to fix any state leaks is to reboot the server.  The
> > > server throws everything away, the clients reclaim, all that's left
> > > is stuff they still actually care about.
> > >
> > > It's very disruptive.
> > >
> > > But you could do a limited version of that: the server throws away
> > > the state from one client (keeping the underlying locks on the
> > > exported filesystem), lets the client go through its normal reclaim
> > > process, at the end of that throws away anything that wasn't
> > > reclaimed.  The only delay is to anyone trying to acquire new locks
> > > that conflict with that set of locks, and only for as long as it
> > > takes for the one client to reclaim.
> >
> > One could do that, but that requires the existence of a quiescent
> > period where the client holds no state at all on the server.
> 
> No, as I said, the client performs reboot recovery for any state that it holds
> when we do this.

Yea, but the original sever goes through a period where it has dropped all state and isn't in grace, and if it's coordinating with non-NFS users, they don't know anything about grace anyway.

Frank


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

