Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7FB4D38F8
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 19:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646851162;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5SHAxq7a8JNH9aVs8aXMOWC1Nj5PHl1qo9gUFwCVO28=;
	b=ZcJX9Q7kfGYZaLlS1rpW8SgKe7PlJabjRiuB+G9gj1qyczy5+27958y5H9hfZHTeZD10CK
	ogOregqb+YNeDzY5dh4X5Dk64OC5/80yCxsowgttwgWfsUuCMnTzRb1eSYf0vQdocjH0ZB
	gPNGAzKB5qvpJ78JwPmvQXrPv/5f3DI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-NQaBtMm5Nt-GRFaccn6PlA-1; Wed, 09 Mar 2022 13:39:19 -0500
X-MC-Unique: NQaBtMm5Nt-GRFaccn6PlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE5583820558;
	Wed,  9 Mar 2022 18:39:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FDF340D2969;
	Wed,  9 Mar 2022 18:39:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 845CC1953572;
	Wed,  9 Mar 2022 18:39:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 65A0E1953565 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 18:39:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDCF653B3; Wed,  9 Mar 2022 18:39:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E965453AC
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 18:39:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9DB6101AA47
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 18:39:13 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-QRuIzP2YNg-JlDEOPES7Lg-1; Wed, 09 Mar 2022 13:39:10 -0500
X-MC-Unique: QRuIzP2YNg-JlDEOPES7Lg-1
Received: by mail-qv1-f72.google.com with SMTP id
 f14-20020a0caa8e000000b0043329d67255so2824395qvb.8
 for <linux-cachefs@redhat.com>; Wed, 09 Mar 2022 10:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=TU5GSQcUsGsLm0QedmIo4Msii85jhaXsQwdtUQuJMSQ=;
 b=tlLI92L2MhuVhkPdQn9inyMHeSXhpouE1EMuY1WSHb9d3KUpdSePAjsnCA9QSQMry/
 Vwahd16LvpAO/HKOmcsSz/MajO+jiD6st2J0/QYRankVgrfaTLMYT3SnC+tAY3J1kunZ
 rVJ+spGI7h0EnY73yAD/K+jal7JYNSi31qkeSkXvsTL1FFt0u/yvGi2uJWSR0GLPxNAO
 SPq2SNIgpgrFN4JaRTebbrVzG3/cybEVKzZIN+bYz+ylWxEW3EPeUcvQldRV9HyCRTPt
 uq5xRUiR5LId1AyW3oWoJf/Razau2CmCqNeN946/WvBzk7vjl5zqi04M3uU7vUj/Lull
 KbpA==
X-Gm-Message-State: AOAM53221NZFOVwS6DLwWwsQtP8YAk12h8F4jz5H7p67MVZFICI9FxPD
 tKeCByusJTWLI1kMjZA2ZV+1tePaYtIi2GhvuKWSBmNPzHXbdxrmkCym489xQnYyLdXy8zCPYqV
 IEY3pAVxqNObC2+zNr1bWXg==
X-Received: by 2002:a05:6214:d44:b0:435:b8fd:b1d7 with SMTP id
 4-20020a0562140d4400b00435b8fdb1d7mr808160qvr.19.1646851150314; 
 Wed, 09 Mar 2022 10:39:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzICtIC42Xa9GHFyHP+MaqIARsvCbO2mnHxe/nMuAl463CulcS9BHk/JL6v+PefmyNOF/kr8A==
X-Received: by 2002:a05:6214:d44:b0:435:b8fd:b1d7 with SMTP id
 4-20020a0562140d4400b00435b8fdb1d7mr808157qvr.19.1646851150152; 
 Wed, 09 Mar 2022 10:39:10 -0800 (PST)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
 [68.20.15.154]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05622a180700b002e0ccf0aa49sm1829549qtc.62.2022.03.09.10.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 10:39:09 -0800 (PST)
Message-ID: <737c8db7461567ec04d5e2a7dbec58b699f8f16c.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>
Date: Wed, 09 Mar 2022 13:39:08 -0500
In-Reply-To: <1712592.1646840957@warthog.procyon.org.uk>
References: <c2f4b3dc107b106e04c48f54945a12715cccfdf3.camel@redhat.com>
 <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678192454.1200972.4428834328108580460.stgit@warthog.procyon.org.uk>
 <1712592.1646840957@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v2 02/19] netfs: Generate enums from
 trace symbol mapping lists
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-03-09 at 15:49 +0000, David Howells wrote:
> Jeff Layton <jlayton@redhat.com> wrote:
> 
> > Should you undef EM and E_ here after creating these?
> 
> Maybe.  So far it hasn't mattered...
> 

I wasn't suggesting there was a bug there, more just a code hygiene
thing. With macro names as generic as that (especially), it'd probably
be good to undef them once you're done.
-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

