Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D512651A3A1
	for <lists+linux-cachefs@lfdr.de>; Wed,  4 May 2022 17:19:20 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-PQ3cNyzHN8-LZEPbnCSZUQ-1; Wed, 04 May 2022 11:19:16 -0400
X-MC-Unique: PQ3cNyzHN8-LZEPbnCSZUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33CC329AB40D;
	Wed,  4 May 2022 15:19:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87F8DC159B3;
	Wed,  4 May 2022 15:19:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1A09C1947048;
	Wed,  4 May 2022 15:19:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 312121947043 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  4 May 2022 15:19:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11EBD2024CC6; Wed,  4 May 2022 15:19:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C06B2027EB4
 for <linux-cachefs@redhat.com>; Wed,  4 May 2022 15:18:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FF183C11A03
 for <linux-cachefs@redhat.com>; Wed,  4 May 2022 15:18:44 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-J8FMJVePO6-DUGilwq8H2A-1; Wed, 04 May 2022 11:18:41 -0400
X-MC-Unique: J8FMJVePO6-DUGilwq8H2A-1
Received: from leknes.fjasle.eu ([46.142.49.211]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMG6Y-1nVIKn0MnG-00JI3R; Wed, 04 May 2022 17:13:19 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 166813C09D; Wed,  4 May 2022 17:13:17 +0200 (CEST)
Date: Wed, 4 May 2022 17:13:16 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org
Message-ID: <YnKYDC+HfPwRn7HK@fjasle.eu>
References: <YTX02eiVawkpTquX@fjasle.eu> <YaCRLx0/CvrxqlZM@lillesand.fjasle.eu>
MIME-Version: 1.0
In-Reply-To: <YaCRLx0/CvrxqlZM@lillesand.fjasle.eu>
X-Provags-ID: V03:K1:wPd6Jf8Xp9Zv/e8vFx7zpmOSZJrBclPeRnq6itMigLx2L/JLUYY
 uThv0mv+ELkdLDsZAUjSH9H9EkVgnRco45PrbkoQ6L3ER4ePAzpuiaBX5AftD/f+qsnpJHV
 XoZ6o7uRh/ZHd6laazvxyRi4JXXS13rMYqHSwyCDC06b83IrjE2d7G5LxBMRXw5+miagL9x
 dyL1sLWc2sMVIzgNuo5HA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pAi5E3PoS/Q=:6qSdRlZIJO1UBTV5WLxr1h
 WFfF6wnMMRpahpmCuhN96vYZN834xTGyEYCuQNxtGmw/M9YEU3RqAxR2KxGKgN78LhO5/e7aR
 yC/X2UQKBdimPdvDdHGGiVcZNjjcHjtVFHCjFoCX3U2223ZuCeEya4g0bo3CFI0A1sXWR8bbS
 lQ6cUO+79/gHRFCWbr9sVQkuR3Cg2/km4/t0kfmqMVYMEUvBuWpuZvOdGYxOIYfIq4pkABiJZ
 8h7SFin7fIHUpbfHUz7gsPO4zWh1U/j8feWzNFeWugGcE1OqP1CwyGMnx5tiwSD/vHFFRMl/j
 7kzvDeHUEpZqYuBsOf0vRDEirMR+YXm0p7LRAI4rreiUZbD22msu8YQPr/tI9wzonQ35crm0v
 Ig4YEor6IBRpKpuNXntLCchplsX3ETtBWmvzm+nf/XVn73sjyxardMo6CahLRoyaoZVtP15pD
 V4mRoUdIT44owmP39kLO2dbQ00lFN76v8LaLGSxxVm8kL5ibw0odbyk4NRDIF016253Tc5giw
 1QWP0p3iPFIU3XBCX6RoswfF3WZhMYCeDaG3b+C74RkiUnsjPIjJcrXsGzLG66BYpNNsQvF+r
 J0lv0sC29fepMpBM098w9mt6LsXaqEboYc8EmMGroMfTnTJuZdcg179w/vz1ppsDHY+SwiX/Y
 ly1wMqem/ErXGZDYzBK7rsnrqJ3etE9Ihv7u37JH/sDaqy2fhHs3dEAApWAskzjBfFs4=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH] [RESEND] fscache: re-match
 MODULE_PARM_DESC() calls to module parameters
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 26, 2021 at 08:47:59AM +0100 Nicolas Schier wrote:
> On Mon Sep  6 13:00:41 2021 Nicolas Schier wrote:
> > Fix calls of MODULE_PARM_DESC() such that the first argument matches 
> > the
> > actual module parameter name.  This changes the 'parm' section in the
> > output of `modinfo fscache` from:
> > 
> >     parm: defer_lookup:uint
> >     parm: fscache_defer_lookup:Defer cookie lookup to background thread
> >     parm: defer_create:uint
> >     parm: fscache_defer_create:Defer cookie creation to background thread
> >     parm: debug:uint
> >     parm: fscache_debug:FS-Cache debugging mask
> > 
> > into:
> > 
> >     parm: defer_lookup:Defer cookie lookup to background thread (uint)
> >     parm: defer_create:Defer cookie creation to background thread (uint)
> >     parm: debug:FS-Cache debugging mask (uint)
> > .
> > 
> > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> >  fs/fscache/main.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > --
> > Resend unmodified as list approval for linux-cachefs@r.c timed out.
> > 
> > diff --git a/fs/fscache/main.c b/fs/fscache/main.c
> > index c1e6cc9091aa..ccb06dc0a6e9 100644
> > --- a/fs/fscache/main.c
> > +++ b/fs/fscache/main.c
> > @@ -22,19 +22,19 @@ MODULE_LICENSE("GPL");
> >  unsigned fscache_defer_lookup = 1;
> >  module_param_named(defer_lookup, fscache_defer_lookup, uint,
> >  		   S_IWUSR | S_IRUGO);
> > -MODULE_PARM_DESC(fscache_defer_lookup,
> > +MODULE_PARM_DESC(defer_lookup,
> >  		 "Defer cookie lookup to background thread");
> >  
> >  unsigned fscache_defer_create = 1;
> >  module_param_named(defer_create, fscache_defer_create, uint,
> >  		   S_IWUSR | S_IRUGO);
> > -MODULE_PARM_DESC(fscache_defer_create,
> > +MODULE_PARM_DESC(defer_create,
> >  		 "Defer cookie creation to background thread");
> >  
> >  unsigned fscache_debug;
> >  module_param_named(debug, fscache_debug, uint,
> >  		   S_IWUSR | S_IRUGO);
> > -MODULE_PARM_DESC(fscache_debug,
> > +MODULE_PARM_DESC(debug,
> >  		 "FS-Cache debugging mask");
> >  
> >  struct kobject *fscache_root;
> > -- 
> > 2.30.1
> 
> David,  I got no feedback on this here, yet.  Shall I fix something or 
> is there anything wrong with the patch?  
> 
> Kind regards,
> Nicolas

ping.

Looking forward for any reply.

Kind regards,
Nicolas

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

