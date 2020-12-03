Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 155A62CE1F5
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 23:40:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Y3TsGW4ON0Kio8BGcjA3ig-1; Thu, 03 Dec 2020 17:40:05 -0500
X-MC-Unique: Y3TsGW4ON0Kio8BGcjA3ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B53B1835B4A;
	Thu,  3 Dec 2020 22:40:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E3EB189C4;
	Thu,  3 Dec 2020 22:40:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45B844BB7B;
	Thu,  3 Dec 2020 22:40:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3Me0kK011787 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 17:40:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EEAA12027144; Thu,  3 Dec 2020 22:39:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9A752026D49
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:39:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0292185A7BC
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:39:57 +0000 (UTC)
Received: from elasmtp-kukur.atl.sa.earthlink.net
	(elasmtp-kukur.atl.sa.earthlink.net [209.86.89.65]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-526-t-d1HU0kNp6WntCWekIZ9A-1;
	Thu, 03 Dec 2020 17:39:55 -0500
X-MC-Unique: t-d1HU0kNp6WntCWekIZ9A-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
	s=dk12062016; d=mindspring.com;
	b=BfXgO5obm06B4hrokZYEkXJtFeTMkuhnh1prbg8LPYisWTDJ1HqH7gMtoyTy6gImQi/s75lFDSmviRB4vRbtLnoRq4v9OY8kdMXNphFMHzyOF7XCfgAhFSLYmdVmqQlgU0/xNOPJ+GqIJJXjHEp1MMes1BGFmJa+ySXhGVJPA1PqdCZ2xsyYJIQ3fJRfEU/H9lwhLciijZSbZ23Mrn9YfpZhhiQmpQ8sNcQjgazXANjnKZM96ZhOTVvvbsRTOUTdHT6ze0oJB/HEqu2cSZhmdW5OHMG2ZUoUisV+conkemO3Lvtzgx2LT3c6zxe8G/SpxEUv1TTfj0QspO/2LuGXow==;
	h=Received:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index:X-ELNK-Trace:X-Originating-IP
Received: from [76.105.143.216] (helo=FRANKSTHINKPAD)
	by elasmtp-kukur.atl.sa.earthlink.net with esmtpa (Exim 4)
	(envelope-from <ffilzlnx@mindspring.com>)
	id 1kkxGT-0009df-Ef; Thu, 03 Dec 2020 17:39:53 -0500
From: "Frank Filz" <ffilzlnx@mindspring.com>
To: "'Trond Myklebust'" <trondmy@hammerspace.com>, <bfields@fieldses.org>
References: <1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
	<20201203185109.GB27931@fieldses.org>
	<4903965f2beb742e0eca089b5db8aa3a4cabb7f0.camel@hammerspace.com>
	<20201203211328.GC27931@fieldses.org>
	<9df8556bf825bd0d565f057b115e35c1b507cf46.camel@hammerspace.com>
	<019001d6c9bd$acbeb6b0$063c2410$@mindspring.com>
	<b9e8da547065f6a94bed22771f214fef91449931.camel@hammerspace.com>
	<20201203220421.GE27931@fieldses.org>
	<0452916df308e9419f472b0d5ffb41815014dce4.camel@hammerspace.com>
In-Reply-To: <0452916df308e9419f472b0d5ffb41815014dce4.camel@hammerspace.com>
Date: Thu, 3 Dec 2020 14:39:52 -0800
Message-ID: <01a001d6c9c5$37eb34f0$a7c19ed0$@mindspring.com>
MIME-Version: 1.0
Thread-Index: AQGLCl71o/mllkcOM8ZTKfem/khTDAJjSqDGAjc9/isC5PHtZAIjFAJ1Aky2llQCn/rUrgIxRIQHAZ398i8CN7bmMADvqBOLAe1pYKWpwddI4A==
X-ELNK-Trace: 136157f01908a8929c7f779228e2f6aeda0071232e20db4d209fd6ce12829a479d17d5949e125da5350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 76.105.143.216
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3Me0kK011787
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



> -----Original Message-----
> From: Trond Myklebust [mailto:trondmy@hammerspace.com]
> Sent: Thursday, December 3, 2020 2:14 PM
> To: bfields@fieldses.org
> Cc: linux-cachefs@redhat.com; ffilzlnx@mindspring.com; linux-
> nfs@vger.kernel.org; daire@dneg.com
> Subject: Re: Adventures in NFS re-exporting
> 
> On Thu, 2020-12-03 at 17:04 -0500, bfields@fieldses.org wrote:
> > On Thu, Dec 03, 2020 at 09:57:41PM +0000, Trond Myklebust wrote:
> > > On Thu, 2020-12-03 at 13:45 -0800, Frank Filz wrote:
> > > > > On Thu, 2020-12-03 at 16:13 -0500, bfields@fieldses.org wrote:
> > > > > > On Thu, Dec 03, 2020 at 08:27:39PM +0000, Trond Myklebust
> > > > > > wrote:
> > > > > > > On Thu, 2020-12-03 at 13:51 -0500, bfields wrote:
> > > > > > > > I've been scratching my head over how to handle reboot of
> > > > > > > > a
> > > > > > > > re-
> > > > > > > > exporting server.  I think one way to fix it might be just
> > > > > > > > to allow the re- export server to pass along reclaims to
> > > > > > > > the original server as it receives them from its own
> > > > > > > > clients.  It might require some protocol tweaks, I'm not
> > > > > > > > sure.  I'll try to get my thoughts in order and propose
> > > > > > > > something.
> > > > > > > >
> > > > > > >
> > > > > > > It's more complicated than that. If the re-exporting server
> > > > > > > reboots, but the original server does not, then unless that
> > > > > > > re- exporting server persisted its lease and a full set of
> > > > > > > stateids somewhere, it will not be able to atomically
> > > > > > > reclaim delegation and lock state on the server on behalf of
> > > > > > > its clients.
> > > > > >
> > > > > > By sending reclaims to the original server, I mean literally
> > > > > > sending new open and lock requests with the RECLAIM bit set,
> > > > > > which would get brand new stateids.
> > > > > >
> > > > > > So, the original server would invalidate the existing client's
> > > > > > previous clientid and stateids--just as it normally would on
> > > > > > reboot--but it would optionally remember the underlying locks
> > > > > > held by the client and allow compatible lock reclaims.
> > > > > >
> > > > > > Rough attempt:
> > > > > >
> > > > > >
> > > > > > https://wiki.linux-nfs.org/wiki/index.php/Reboot_recovery_for_
> > > > > > re-expor
> > > > > > t_servers
> > > > > >
> > > > > > Think it would fly?
> > > > >
> > > > > So this would be a variant of courtesy locks that can be
> > > > > reclaimed by the client using the reboot reclaim variant of
> > > > > OPEN/LOCK outside the grace period? The purpose being to allow
> > > > > reclaim without forcing the client to persist the original
> > > > > stateid?
> > > > >
> > > > > Hmm... That's doable, but how about the following alternative:
> > > > > Add
> > > > > a function
> > > > > that allows the client to request the full list of stateids that
> > > > > the server holds on its behalf?
> > > > >
> > > > > I've been wanting such a function for quite a while anyway in
> > > > > order to allow the client to detect state leaks (either due to
> > > > > soft timeouts, or due to reordered close/open operations).
> > > >
> > > > Oh, that sounds interesting. So basically the re-export server
> > > > would re-populate it's state from the original server rather than
> > > > relying on it's clients doing reclaims? Hmm, but how does the
> > > > re-export server rebuild its stateids? I guess it could make the
> > > > clients repopulate them with the same "give me a dump of all my
> > > > state", using the state details to match up with the old state and
> > > > replacing stateids. Or did you have something different in mind?
> > > >
> > >
> > > I was thinking that the re-export server could just use that list of
> > > stateids to figure out which locks can be reclaimed atomically, and
> > > which ones have been irredeemably lost. The assumption is that if
> > > you have a lock stateid or a delegation, then that means the clients
> > > can reclaim all the locks that were represented by that stateid.
> >
> > I'm confused about how the re-export server uses that list.  Are you
> > assuming it persisted its own list across its own crash/reboot?  I
> > guess that's what I was trying to avoid having to do.
> >
> No. The server just uses the stateids as part of a check for 'do I hold state for
> this file on this server?'. If the answer is 'yes' and the lock owners are sane, then
> we should be able to assume the full set of locks that lock owner held on that
> file are still valid.
> 
> BTW: if the lock owner is also returned by the server, then since the lock owner
> is an opaque value, it could, for instance, be used by the client to cache info on
> the server about which uid/gid owns these locks.

Let me see if I'm understanding your idea right...

Re-export server reboots within the extended lease period it's been given by the original server. I'm assuming it uses the same clientid? But would probably open new sessions. It requests the list of stateids. Hmm, how to make the owner information useful, nfs-ganesha doesn't pass on the actual client's owner but rather just passes the address of its record for that client owner. Maybe it will have to do something a bit different for this degree of re-export support...

Now the re-export server knows which original client lock owners are allowed to reclaim state. So it just acquires locks using the original stateid as the client reclaims (what happens if the client doesn't reclaim a lock? I suppose the re-export server could unlock all regions not explicitly locked once reclaim is complete). Since the re-export server is acquiring new locks using the original stateid it will just overlay the original lock with the new lock and write locks don't conflict since they are being acquired by the same lock owner. Actually the original server could even balk at a "reclaim" in this way that wasn't originally held... And the original server could "refresh" the locks, and discard any that aren't refreshed at the end of reclaim. That part assumes the original server is apprised that what is actually happening is a reclaim.

The re-export server can destroy any stateids that it doesn't receive reclaims for.

Hmm, I think if the re-export server is implemented as an HA cluster, it should establish a clientid on the original server for each virtual IP (assuming that's the unit of HA)  that exists. Then when virtual IPs are moved, the re-export server just goes through the above reclaim process for that clientid.

Frank


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

