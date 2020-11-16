Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E03D2B507F
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 20:04:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-xlg12ZJyME2RZgS1aBvt2g-1; Mon, 16 Nov 2020 14:03:57 -0500
X-MC-Unique: xlg12ZJyME2RZgS1aBvt2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CFA11891E84;
	Mon, 16 Nov 2020 19:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8198710013DB;
	Mon, 16 Nov 2020 19:03:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55D9E58121;
	Mon, 16 Nov 2020 19:03:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGJ3iC6015310 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 14:03:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD8C0110FBE7; Mon, 16 Nov 2020 19:03:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4FA3110FC04
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 19:03:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BF7D80353B
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 19:03:40 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-218-ShUCf1-wNf6yKT-HW9KzBA-1;
	Mon, 16 Nov 2020 14:03:37 -0500
X-MC-Unique: ShUCf1-wNf6yKT-HW9KzBA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id D627F1C15; Mon, 16 Nov 2020 14:03:36 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org D627F1C15
Date: Mon, 16 Nov 2020 14:03:36 -0500
From: bfields <bfields@fieldses.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20201116190336.GH898@fieldses.org>
References: <444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
	<b0d61b4053442ba46fd2c707ee7e0608704c2598.camel@kernel.org>
	<20201116155619.GF898@fieldses.org>
	<83ebb6dc68216ce3f3dfd2a2736b7a301550efc5.camel@kernel.org>
	<20201116161407.GG898@fieldses.org>
	<db55bab87b6fc9dd1594f8c2e853f07b1165ff5d.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <db55bab87b6fc9dd1594f8c2e853f07b1165ff5d.camel@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2020 at 11:38:44AM -0500, Jeff Layton wrote:
> Hmm, ok... nfsd4_change_attribute() is called from nfs4 code but also
> nfs3 code as well. The v4 caller (encode_change) only calls it when
> IS_I_VERSION is set, but the v3 callers don't seem to pay attention to
> that.

Weird.  Looking back....  That goes back to the original patch adding
support for ext4's i_version, c654b8a9cba6 "nfsd: support ext4
i_version".

It's in nfs3xdr.c, but the fields it's filling in, fh_pre_change and
fh_post_change, are only used in nfs4xdr.c.  Maybe moving it someplace
else (vfs.c?) would save some confusion.

Anyway, yes, that should be checking SB_I_VERSION too.

> I think the basic issue here is that we're trying to use SB_I_VERSION
> for two different things. Its main purpose is to tell the kernel that
> when it's updating the file times that it should also (possibly)
> increment the i_version counter too. (Some of this is documented in
> include/linux/iversion.h too, fwiw)
> 
> nfsd needs a way to tell whether the field should be consulted at all.
> For that we probably do need a different flag of some sort. Doing it at
> the fstype level seems a bit wrong though -- v2/3 don't have a real
> change attribute and it probably shouldn't be trusted when exporting
> them.

Oops, good point.

I suppose simplest is just another SB_ flag.

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

