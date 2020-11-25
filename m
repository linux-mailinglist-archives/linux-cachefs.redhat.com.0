Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 686892C486D
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 Nov 2020 20:31:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-qOqtYu-xNGOgtAFw3fVuOw-1; Wed, 25 Nov 2020 14:31:51 -0500
X-MC-Unique: qOqtYu-xNGOgtAFw3fVuOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFB291E7DB;
	Wed, 25 Nov 2020 19:31:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D005E5C1B4;
	Wed, 25 Nov 2020 19:31:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 440B7180954D;
	Wed, 25 Nov 2020 19:31:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APJViPh026751 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 14:31:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF579A9F36; Wed, 25 Nov 2020 19:31:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6704AC97F
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 19:31:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CABC7103B80F
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 19:31:41 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-302-FMg8xOUYP_mGTUGpdAwo3A-1;
	Wed, 25 Nov 2020 14:31:39 -0500
X-MC-Unique: FMg8xOUYP_mGTUGpdAwo3A-1
Received: by fieldses.org (Postfix, from userid 2815)
	id A6EDE6EAE; Wed, 25 Nov 2020 14:31:38 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org A6EDE6EAE
Date: Wed, 25 Nov 2020 14:31:38 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201125193138.GC7049@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
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
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Trond Myklebust <trondmy@hammerspace.com>
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

On Wed, Nov 25, 2020 at 05:14:51PM +0000, Daire Byrne wrote:
> Cool. I'm glad there are some notes for others to reference - this
> thread is now too long for any human to read. The only things I'd
> consider adding are:

Thanks, done.

> * re-export of NFSv4.0 filesystem can give input/output errors when the cache is dropped

Looking back at that thread....  I suspect that's just unfixable, so all
you can do is either use v4.1+ on the original server or 4.0+ on the
edge clients.  Or I wonder if it would help if there was some way to
tell the 4.0 client just to try special stateids instead of attempting
an open?

> * a weird interaction with nfs client readahead such that all reads
> are limited to the default 128k unless you manually increase it to
> match rsize.
>
> The only other thing I can offer are tips & tricks for doing this kind
> of thing over the WAN (vfs_cache_pressure, actimeo, nocto) and using
> fscache.

OK, I haven't tried to pick that out of the thread yet.

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

