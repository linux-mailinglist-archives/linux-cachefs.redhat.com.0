Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 578072C42D3
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 Nov 2020 16:25:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-Q1Fwy_xvMO6Fyo4VjklezA-1; Wed, 25 Nov 2020 10:25:32 -0500
X-MC-Unique: Q1Fwy_xvMO6Fyo4VjklezA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12BDCC7402;
	Wed, 25 Nov 2020 15:25:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A267A5C1C2;
	Wed, 25 Nov 2020 15:25:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F33C857683;
	Wed, 25 Nov 2020 15:25:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APElx1k022564 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 09:48:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B252CA9F1B; Wed, 25 Nov 2020 14:47:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC283A9F5E
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 14:47:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D4C3103B807
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 14:47:56 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-227-HZ8DsGmJPkmTV4MBa8L-TQ-1;
	Wed, 25 Nov 2020 09:47:54 -0500
X-MC-Unique: HZ8DsGmJPkmTV4MBa8L-TQ-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 10D696EA1; Wed, 25 Nov 2020 09:47:53 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 10D696EA1
Date: Wed, 25 Nov 2020 09:47:53 -0500
From: "'bfields'" <bfields@fieldses.org>
To: Frank Filz <ffilzlnx@mindspring.com>
Message-ID: <20201125144753.GC2811@fieldses.org>
References: <20200915172140.GA32632@fieldses.org>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<0fc201d6c2af$62b039f0$2810add0$@mindspring.com>
MIME-Version: 1.0
In-Reply-To: <0fc201d6c2af$62b039f0$2810add0$@mindspring.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2020 at 02:15:57PM -0800, Frank Filz wrote:
> How much conversation about re-export has been had at the wider NFS
> community level? I have an interest because Ganesha  supports re-export via
> the PROXY_V3 and PROXY_V4 FSALs. We currently don't have a data cache though
> there has been discussion of such, we do have attribute and dirent caches.
> 
> Looking over the wiki page, I have considered being able to specify a
> re-export of a Ganesha export without encapsulating handles. Ganesha
> encapsulates the export_fs handle in a way that could be coordinated between
> the original server and the re-export so they would both effectively have
> the same encapsulation layer.

In the case the re-export server only servers a single export, I guess
you could do away with the encapsulation.  (The only risk I see is that
a client of the re-export server could also access any export of the
original server if it could guess filehandles, which might surprise
admins.)  Maybe that'd be useful.

Another advantage of not encapsulating filehandles is that clients could
more easily migrate between servers.

Cooperating servers could have an agreement on filehandles.  And I guess
we could standardize that somehow.  Are we ready for that?  I'm not sure
what other re-exporting problems there are that I haven't thought of.

--b.

> I'd love to see some re-export best practices shared among server
> implementations, and also what we can do to improve things when two server
> implementations are interoperating via re-export.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

