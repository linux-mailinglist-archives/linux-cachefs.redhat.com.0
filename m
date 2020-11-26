Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95A172C4BC1
	for <lists+linux-cachefs@lfdr.de>; Thu, 26 Nov 2020 01:05:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-3J4LejQYOCiCuiiFAoqp6g-1; Wed, 25 Nov 2020 19:05:09 -0500
X-MC-Unique: 3J4LejQYOCiCuiiFAoqp6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F2781E7DF;
	Thu, 26 Nov 2020 00:05:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E74B819C46;
	Thu, 26 Nov 2020 00:05:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 755D3180954D;
	Thu, 26 Nov 2020 00:05:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQ04wTW022152 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 19:04:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 803BBADF93; Thu, 26 Nov 2020 00:04:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ACE3ADF9C
	for <linux-cachefs@redhat.com>; Thu, 26 Nov 2020 00:04:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 148588007DF
	for <linux-cachefs@redhat.com>; Thu, 26 Nov 2020 00:04:56 +0000 (UTC)
Received: from elasmtp-curtail.atl.sa.earthlink.net
	(elasmtp-curtail.atl.sa.earthlink.net [209.86.89.64]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-240-v9YpgWVAMLKf2TtDnPkvjA-1;
	Wed, 25 Nov 2020 19:04:53 -0500
X-MC-Unique: v9YpgWVAMLKf2TtDnPkvjA-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
	s=dk12062016; d=mindspring.com;
	b=I2a+6DjG0npKYda/Am8eiHCLQZvxGGcp1CfEudE83zBkIXQ6jQ/1HHSI074U394kQG4uU83xnHYP/DpFMIjB7BZS7hIK00MTPbLdlDZDA+oVH8Z5yuQ/UOEYXGIQJj1Ga+aE9V1efO4qBzBpCBKy/KVAE6W9IHDYm8ZJL8RkL/uEmGOSeWaZL21el4Q9pSnZIx+z8+5PnUrnDoKasZpKTAE1X2Ftk9pZ/Fl/qXSsTcv6gebSHUq3TrVRjm+luGO8RO3vmXtl9FXG49Udg3aOjtWeDGDnUlzXskF9PfVr8C5VnD6TJG8gTksoFNhtzpz1gIbhSoD1rAyWaxUNlL5wiQ==;
	h=Received:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:X-ELNK-Trace:X-Originating-IP
Received: from [76.105.143.216] (helo=FRANKSTHINKPAD)
	by elasmtp-curtail.atl.sa.earthlink.net with esmtpa (Exim 4)
	(envelope-from <ffilzlnx@mindspring.com>)
	id 1ki4mJ-0001AK-KG; Wed, 25 Nov 2020 19:04:51 -0500
From: "Frank Filz" <ffilzlnx@mindspring.com>
To: "'bfields'" <bfields@fieldses.org>
References: <1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<0fc201d6c2af$62b039f0$2810add0$@mindspring.com>
	<20201125144753.GC2811@fieldses.org>
	<100101d6c347$917ed0f0$b47c72d0$@mindspring.com>
	<20201125190315.GB7049@fieldses.org>
In-Reply-To: <20201125190315.GB7049@fieldses.org>
Date: Wed, 25 Nov 2020 16:04:51 -0800
Message-ID: <103e01d6c387$c3d7f640$4b87e2c0$@mindspring.com>
MIME-Version: 1.0
Thread-Index: AQLbRzS9yZr5C5vAyHWnu9xOS+RZ+gH6EgB+ATmqgtcBmvnx5gFd2itFAYsKXvUCY0qgxgKfDMlvApwox1gCn5pjiwGJmGGRpzSF2/A=
X-ELNK-Trace: 136157f01908a8929c7f779228e2f6aeda0071232e20db4dbf9d46175fc33655b0564f0bda0d754b350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
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
X-loop: linux-cachefs@redhat.com
Cc: 'Daire Byrne' <daire@dneg.com>, 'linux-cachefs' <linux-cachefs@redhat.com>,
	'linux-nfs' <linux-nfs@vger.kernel.org>,
	'Trond Myklebust' <trondmy@hammerspace.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: 'bfields' [mailto:bfields@fieldses.org]
> Sent: Wednesday, November 25, 2020 11:03 AM
> To: Frank Filz <ffilzlnx@mindspring.com>
> Cc: 'Daire Byrne' <daire@dneg.com>; 'Trond Myklebust'
> <trondmy@hammerspace.com>; 'linux-cachefs' <linux-cachefs@redhat.com>;
> 'linux-nfs' <linux-nfs@vger.kernel.org>
> Subject: Re: Adventures in NFS re-exporting
> 
> On Wed, Nov 25, 2020 at 08:25:19AM -0800, Frank Filz wrote:
> > On the other
> > hand, re-export with state has a pitfall. If the re-export server
> > crashes, the state is lost on the original server unless we make a
> > protocol change to allow state re-export such that a re-export server
> > crashing doesn't cause state loss.
> 
> Oh, yes, reboot recovery's an interesting problem that I'd forgotten
about;
> added to that wiki page.
>
> By "state re-export" you mean you'd take the stateids the original server
> returned to you, and return them to your own clients?  So then I guess you
> wouldn't need much state at all.

By state re-export I meant reflecting locks the end client takes on the
re-export server to the original server. Not necessarily by reflecting the
stateid (probably something to trip on there...) (Can we nail down a good
name for it? Proxy server or re-export server work well for the man in the
middle, but what about the back end server?)

Frank

> > For this reason, I haven't rushed to implement lock state re-export in
> > Ganesha, rather allowing the re-export server to just manage lock
> > state locally.
> >
> > > Cooperating servers could have an agreement on filehandles.  And I
> > > guess
> > we
> > > could standardize that somehow.  Are we ready for that?  I'm not
> > > sure what other re-exporting problems there are that I haven't thought
of.
> >
> > I'm not sure how far we want to go there, but potentially specific
> > server implementations could choose to be interoperable in a way that
> > allows the handle encapsulation to either be smaller or no extra
> > overhead. For example, if we implemented what I've thought about for
> > Ganesha-Ganesha re-export, Ganesha COULD also be "taught" which
> > portion of the knfsd handle is the filesystem/export identifier, and
> > maintain a database of Ganesha export/filesystem <-> knfsd
> > export/filesystem and have Ganesha re-encapsulate the
> > exportfs/name_to_handle_at portion of the handle. Of course in this
> > case, trivial migration isn't possible since Ganesha will have a
different
> encapsulation than knfsd.
> >
> > Incidentally, I also purposefully made Ganesha's encapsulation
> > different so it never collides with either version of knfsd handles
> > (now if over the course of the past 10 years another handle version has
come
> along...).
> 
> I don't think anything's changed there.
> 
> --b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

