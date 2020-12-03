Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 962832CE0D1
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 22:36:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-UfHVPcmPPN-yDZTF_9dBIQ-1; Thu, 03 Dec 2020 16:36:02 -0500
X-MC-Unique: UfHVPcmPPN-yDZTF_9dBIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75237800D55;
	Thu,  3 Dec 2020 21:35:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC7515C1B4;
	Thu,  3 Dec 2020 21:35:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B957D4BB7B;
	Thu,  3 Dec 2020 21:35:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3LWiKu004109 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 16:32:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA3012166B27; Thu,  3 Dec 2020 21:32:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4BA42166B2C
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:32:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC53858EEC
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 21:32:41 +0000 (UTC)
Received: from elasmtp-dupuy.atl.sa.earthlink.net
	(elasmtp-dupuy.atl.sa.earthlink.net [209.86.89.62]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-480-B-VJhtHPOGCA5BhD7wKKKg-1;
	Thu, 03 Dec 2020 16:32:39 -0500
X-MC-Unique: B-VJhtHPOGCA5BhD7wKKKg-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
	s=dk12062016; d=mindspring.com;
	b=Be7idtbucoNu33dD2rRql0twawJGmiNaWArbmUaAso+m30z0LXgEuSvMD9xSWzyWsXJ5e6HBjkmo29hd/oVihbSxxbX1N8XuRL10rsWnfCn7dYKRh1zniNmRFZxSLqdJXFNFG+WYqcS3lEro9pyUpdecLCIeUgOJLJkoQv2EXOu5js+Jb7ACptWZ74t3DxPWHwTAqOTNKR42nAMibqH2eTsk7ufNbRsQ1jj4TLfGq77ejJM6Hc41F++rPaYv9pcuRArwyDvtFyibno+f9TZ2ACk6hU4SVQ7uuNGC0mkdsk1Mr4wzZEx7c9RiLRjrwMSCl6Yi82GaZQExU6G57/hr6g==;
	h=Received:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index:X-ELNK-Trace:X-Originating-IP
Received: from [76.105.143.216] (helo=FRANKSTHINKPAD)
	by elasmtp-dupuy.atl.sa.earthlink.net with esmtpa (Exim 4)
	(envelope-from <ffilzlnx@mindspring.com>)
	id 1kkwDM-000Gy1-22; Thu, 03 Dec 2020 16:32:36 -0500
From: "Frank Filz" <ffilzlnx@mindspring.com>
To: <bfields@fieldses.org>, "'Trond Myklebust'" <trondmy@hammerspace.com>
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
In-Reply-To: <20201203211328.GC27931@fieldses.org>
Date: Thu, 3 Dec 2020 13:32:34 -0800
Message-ID: <018d01d6c9bb$d16eb890$744c29b0$@mindspring.com>
MIME-Version: 1.0
Thread-Index: AQH6EgB+BqEYpR696aBJdQxY01PEsQE5qoLXAZr58eYBXdorRQGLCl71AmNKoMYCNz3+KwLk8e1kAiMUAnUCTLaWVAKf+tSuqPzrGvA=
X-ELNK-Trace: 136157f01908a8929c7f779228e2f6aeda0071232e20db4d7249f465b171b271a08ce68149647c55350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 76.105.143.216
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3LWiKu004109
X-loop: linux-cachefs@redhat.com
Cc: daire@dneg.com, linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	'Solomon Boulos' <boulos@google.com>
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

> On Thu, Dec 03, 2020 at 08:27:39PM +0000, Trond Myklebust wrote:
> > On Thu, 2020-12-03 at 13:51 -0500, bfields wrote:
> > > I've been scratching my head over how to handle reboot of a re-
> > > exporting server.  I think one way to fix it might be just to allow
> > > the re- export server to pass along reclaims to the original server
> > > as it receives them from its own clients.  It might require some
> > > protocol tweaks, I'm not sure.  I'll try to get my thoughts in order
> > > and propose something.
> > >
> >
> > It's more complicated than that. If the re-exporting server reboots,
> > but the original server does not, then unless that re-exporting server
> > persisted its lease and a full set of stateids somewhere, it will not
> > be able to atomically reclaim delegation and lock state on the server
> > on behalf of its clients.
> 
> By sending reclaims to the original server, I mean literally sending new
> open and lock requests with the RECLAIM bit set, which would get brand
> new stateids.
> 
> So, the original server would invalidate the existing client's previous
> clientid and stateids--just as it normally would on reboot--but it would
> optionally remember the underlying locks held by the client and allow
> compatible lock reclaims.
> 
> Rough attempt:
> 
> 	https://wiki.linux-nfs.org/wiki/index.php/Reboot_recovery_for_re-
> export_servers
> 
> Think it would fly?

At a quick read through, that sounds good. I'm sure there's some bits and bobs we need to fix up.

I'm cc:ing Jeff Layton because what the original server needs to do looks a bit like what he implemented in CephFS to allow HA restarts of nfs-ganesha instances.

Maybe we should take this to the IETF mailing list? I'm certainly interested in discussion on what we could do in the protocol to facilitate this from nfs-ganesha perspective.

Frank




--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

