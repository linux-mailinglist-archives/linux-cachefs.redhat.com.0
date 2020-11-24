Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B89A2C3C42
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 Nov 2020 10:37:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-Cqew0FodMmihKabtq8BAYQ-1; Wed, 25 Nov 2020 04:37:11 -0500
X-MC-Unique: Cqew0FodMmihKabtq8BAYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D856192AB9D;
	Wed, 25 Nov 2020 09:36:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 473C970398;
	Wed, 25 Nov 2020 09:36:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E464718095C9;
	Wed, 25 Nov 2020 09:36:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AP1s9aw020356 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 20:54:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D211D2026D25; Wed, 25 Nov 2020 01:54:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD42F2026D46
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 01:54:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CADE811E84
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 01:54:06 +0000 (UTC)
Received: from elasmtp-mealy.atl.sa.earthlink.net
	(elasmtp-mealy.atl.sa.earthlink.net [209.86.89.69]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-105-JIB3VcfePIqbidxCK9dOWQ-1;
	Tue, 24 Nov 2020 20:54:04 -0500
X-MC-Unique: JIB3VcfePIqbidxCK9dOWQ-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
	s=dk12062016; d=mindspring.com;
	b=RvDhKIIgbQUkWclDZl+V+s9PvPDXoAcDFXTSoteuWdvs1YuBQEzvf+xYqONNJ81vmQmFopSHXhVKISYl62DmAkTdHIpIpEoHbPn5wLxTBchNhuKeK8FrnfnU50AfRxh178CyPExdjhtHiOlXkmRAPFX6Tecwfcl19pQ1wvfUrS7tl33QSER3dgY2ce0I8LxXWGpJU5dK+rSa+to2b74OB3qTqFD1lgprZgWXbow0uSbXKcR2Vj0T8alW5BGTs3mE7eZjS1dGObpl7oWD8EkHz4cdptJ46XaSqdXUUtKbgx0sx+coQE9SYsMA7k3SEKp9vV9+Hkuh7HQwsFS4sy1z7A==;
	h=Received:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:X-ELNK-Trace:X-Originating-IP
Received: from [76.105.143.216] (helo=FRANKSTHINKPAD)
	by elasmtp-mealy.atl.sa.earthlink.net with esmtpa (Exim 4)
	(envelope-from <ffilzlnx@mindspring.com>)
	id 1khgbN-000CgU-J5; Tue, 24 Nov 2020 17:15:57 -0500
From: "Frank Filz" <ffilzlnx@mindspring.com>
To: "'bfields'" <bfields@fieldses.org>, "'Daire Byrne'" <daire@dneg.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
In-Reply-To: <20201124211522.GC7173@fieldses.org>
Date: Tue, 24 Nov 2020 14:15:57 -0800
Message-ID: <0fc201d6c2af$62b039f0$2810add0$@mindspring.com>
MIME-Version: 1.0
Thread-Index: AQFnsTuWEsgY2WPwTcQ0fYvcmUGZKgIMJHTNAj0KZ+kC20c0vQH6EgB+ATmqgtcBmvnx5gFd2itFAYsKXvUCY0qgxqor/wtQ
X-ELNK-Trace: 136157f01908a8929c7f779228e2f6aeda0071232e20db4d40750170795307db90ea33c32f0615bb350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
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
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 25 Nov 2020 04:36:42 -0500
Cc: 'linux-nfs' <linux-nfs@vger.kernel.org>,
	'linux-cachefs' <linux-cachefs@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Tue, Nov 24, 2020 at 08:35:06PM +0000, Daire Byrne wrote:
> > Sometimes I have seen clusters of 16 GETATTRs for the same file on the
> > wire with nothing else inbetween. So if the re-export server is the
> > only "client" writing these files to the originating server, why do we
> > need to do so many repeat GETATTR calls when using nconnect>1? And why
> > are the COMMIT calls required when the writes are coming via nfsd but
> > not from userspace on the re-export server? Is that due to some sort
> > of memory pressure or locking?
> >
> > I picked the NFSv3 originating server case because my head starts to
> > hurt tracking the equivalent packets, stateids and compound calls with
> > NFSv4. But I think it's mostly the same for NFSv4. The writes through
> > the re-export server lead to lots of COMMITs and (double) GETATTRs but
> > using nconnect>1 at least doesn't seem to make it any worse like it
> > does for NFSv3.
> >
> > But maybe you actually want all the extra COMMITs to help better
> > guarantee your writes when putting a re-export server in the way?
> > Perhaps all of this is by design...
> 
> Maybe that's close-to-open combined with the server's tendency to
open/close
> on every IO operation?  (Though the file cache should have helped with
that, I
> thought; as would using version >=4.0 on the final
> client.)
> 
> Might be interesting to know whether the nocto mount option makes a
> difference.  (So, add "nocto" to the mount options for the NFS mount that
> you're re-exporting on the re-export server.)
> 
> By the way I made a start at a list of issues at
> 
> 	http://wiki.linux-nfs.org/wiki/index.php/NFS_re-export
> 
> but I was a little vague on which of your issues remained and didn't take
much
> time over it.
> 
> (If you want an account on that wiki BTW I seem to recall you just have to
ask
> Trond (for anti-spam reasons).)

How much conversation about re-export has been had at the wider NFS
community level? I have an interest because Ganesha  supports re-export via
the PROXY_V3 and PROXY_V4 FSALs. We currently don't have a data cache though
there has been discussion of such, we do have attribute and dirent caches.

Looking over the wiki page, I have considered being able to specify a
re-export of a Ganesha export without encapsulating handles. Ganesha
encapsulates the export_fs handle in a way that could be coordinated between
the original server and the re-export so they would both effectively have
the same encapsulation layer.

I'd love to see some re-export best practices shared among server
implementations, and also what we can do to improve things when two server
implementations are interoperating via re-export.

Frank

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

