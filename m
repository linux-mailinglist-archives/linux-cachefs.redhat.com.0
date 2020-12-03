Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 029D32CE101
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 22:46:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-ATaWa_xNOSy5UeYsma7sLQ-1; Thu, 03 Dec 2020 16:46:06 -0500
X-MC-Unique: ATaWa_xNOSy5UeYsma7sLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6CE75F9E3;
	Thu,  3 Dec 2020 21:46:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D1D1349A;
	Thu,  3 Dec 2020 21:46:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71EFE4BB7B;
	Thu,  3 Dec 2020 21:46:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3Lk0o3005472 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 16:46:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 360DCF11DE; Thu,  3 Dec 2020 21:46:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FD45F11DC
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:45:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 967E8858EEC
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:45:57 +0000 (UTC)
Received: from elasmtp-masked.atl.sa.earthlink.net
	(elasmtp-masked.atl.sa.earthlink.net [209.86.89.68]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-520-eGDYau2iO8Wb3Rd7-q0Elw-1;
	Thu, 03 Dec 2020 16:45:55 -0500
X-MC-Unique: eGDYau2iO8Wb3Rd7-q0Elw-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
	s=dk12062016; d=mindspring.com;
	b=Pdg9W63an64CEBPJPLbKjpwKkZFILqgVvJEY0xiN4ESlSl+b3VyKRQdolD10FrVD6IbjvhyfSrEoCLFMhT781MNZg6p29RsLFtBV8CxY0w+mI62dxEVVDgi2Do/VQjSsq1Jmt4Cl2+gnJwnHujwZcMFTLWlAnkFJ/+ioVMxqfpTJzM9orJRuz47Wcmmu2qhswWzRfNkmA9IfqUXabcQmRItAOMdctmLLzMxL1UOzPVLk3uTS+wkb9Z+mMzVf+7ezfDzRSBOgnWNAvPLP2H9P0htxoc+/84gJcuxUziI9BlC2URb/yD9zXUlychfG/aRkloi4ZkfTC8V+FjGfnrcx/A==;
	h=Received:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index:X-ELNK-Trace:X-Originating-IP
Received: from [76.105.143.216] (helo=FRANKSTHINKPAD)
	by elasmtp-masked.atl.sa.earthlink.net with esmtpa (Exim 4)
	(envelope-from <ffilzlnx@mindspring.com>)
	id 1kkwQD-000AvW-GC; Thu, 03 Dec 2020 16:45:53 -0500
From: "Frank Filz" <ffilzlnx@mindspring.com>
To: "'Trond Myklebust'" <trondmy@hammerspace.com>, <bfields@fieldses.org>
References: <279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
In-Reply-To: <9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
Date: Thu, 3 Dec 2020 13:45:52 -0800
Message-ID: <019001d6c9bd$acbeb6b0$063c2410$@mindspring.com>
MIME-Version: 1.0
Thread-Index: AQH6EgB+BqEYpR696aBJdQxY01PEsQE5qoLXAZr58eYBXdorRQGLCl71AmNKoMYCNz3+KwLk8e1kAiMUAnUCTLaWVAKf+tSuAjFEhAeo62WsYA==
X-ELNK-Trace: 136157f01908a8929c7f779228e2f6aeda0071232e20db4d9d9b728c00c9d2eb053184b77ba33483350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 76.105.143.216
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3Lk0o3005472
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Thu, 2020-12-03 at 16:13 -0500, bfields@fieldses.org wrote:
> > On Thu, Dec 03, 2020 at 08:27:39PM +0000, Trond Myklebust wrote:
> > > On Thu, 2020-12-03 at 13:51 -0500, bfields wrote:
> > > > I've been scratching my head over how to handle reboot of a re-
> > > > exporting server.  I think one way to fix it might be just to
> > > > allow the re- export server to pass along reclaims to the original
> > > > server as it receives them from its own clients.  It might require
> > > > some protocol tweaks, I'm not sure.  I'll try to get my thoughts
> > > > in order and propose something.
> > > >
> > >
> > > It's more complicated than that. If the re-exporting server reboots,
> > > but the original server does not, then unless that re-exporting
> > > server persisted its lease and a full set of stateids somewhere, it
> > > will not be able to atomically reclaim delegation and lock state on
> > > the server on behalf of its clients.
> >
> > By sending reclaims to the original server, I mean literally sending
> > new open and lock requests with the RECLAIM bit set, which would get
> > brand new stateids.
> >
> > So, the original server would invalidate the existing client's
> > previous clientid and stateids--just as it normally would on
> > reboot--but it would optionally remember the underlying locks held by
> > the client and allow compatible lock reclaims.
> >
> > Rough attempt:
> >
> >
> > https://wiki.linux-nfs.org/wiki/index.php/Reboot_recovery_for_re-expor
> > t_servers
> >
> > Think it would fly?
> 
> So this would be a variant of courtesy locks that can be reclaimed by the client
> using the reboot reclaim variant of OPEN/LOCK outside the grace period? The
> purpose being to allow reclaim without forcing the client to persist the original
> stateid?
> 
> Hmm... That's doable, but how about the following alternative: Add a function
> that allows the client to request the full list of stateids that the server holds on
> its behalf?
> 
> I've been wanting such a function for quite a while anyway in order to allow the
> client to detect state leaks (either due to soft timeouts, or due to reordered
> close/open operations).

Oh, that sounds interesting. So basically the re-export server would re-populate it's state from the original server rather than relying on it's clients doing reclaims? Hmm, but how does the re-export server rebuild its stateids? I guess it could make the clients repopulate them with the same "give me a dump of all my state", using the state details to match up with the old state and replacing stateids. Or did you have something different in mind?

Frank


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

