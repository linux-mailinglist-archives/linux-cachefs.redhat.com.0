Return-Path: <linux-cachefs+bncBDLIXLMFVAERB54T62WAMGQEK5QNVQI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F120828BAF
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 19:01:29 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-429a30f4997sf12600131cf.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 10:01:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704823288; cv=pass;
        d=google.com; s=arc-20160816;
        b=eefZtFyJ+Jo6cL0B4puUrq9uQByKF2QJCXFum8iXXtde0ZMH4xIIKYBSbCKbEbOfdu
         HHE633C2MQaIaGdwSItWjOvj0HHlZ1/U8hlexvsEPnrfpvyHqexlHmMGDTAAqtxgrFlD
         NFBYX21NhF7/5chBCCjvMMGxpmPJXMKIRmyCYrMq5Hq9s2AeUmrX/3ARGTFQNBGoKs70
         nDeXZdkOg3bvQMYJ6dVEEV0VlgVIFkVWpEIyP06YqOvcDLBieVcX+HYus76saMiW5I8A
         lwtgKtTIlX39FGkHvFJ1vaqTf2nz3RR5fQ4XUqILUU2s7NZouc+fBOg8jDGB9tMrF/J6
         NGSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=NonO46Kt+zG39FId5UN3fpcxvW+1oBKonxy/2FZvMIA=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=pHU2UmP/np+xdITMZWCiL0Knn9Twmg+aYmrWgwyHMkuS3GZ0QCsPWhlBlkYEBifvWl
         A9rpKtdiIU/Up7QYw/7LQibMVpdiOb9cXAIo2pdzOTQ1sW8skTKCwAHjsLfXLix2PsVZ
         Pxp0WhjabYqYZ9rQh8mL9+9u7j+G0qe/PlNBtHgxULUltYIz6VTWwH99gRQCiuSdaqGn
         Uc37KtVL2odQIGH/m3vS7oQAi2+ISLIU/6NXDyMvtYAME8RxVrtcgGEWeykuAmJDStlG
         T2AbvT4TUV/N/azh1iEdPHxqC04KCmaARd3V3MqyGnvzFPcD9oiPc3s25OKmmE0jlXS6
         sVag==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823288; x=1705428088;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NonO46Kt+zG39FId5UN3fpcxvW+1oBKonxy/2FZvMIA=;
        b=PoChBD+YVwjp+HwqeYqsi7I2i1k9cxWUBuD3zxK1Jf27OTPWEpajmyQcqs1uNLG7kF
         OSf4a2Qj3+Zq2aY+tWXge0gZESIr4qqn98t5cJ/nz162+gfryFZJEp8T4JGh40m+Tjqz
         NA5U9fEvYIAtnYiXZME8K5prVkJm6kWCC3d6sN1OKAyG4+W45BpO3JJJTV0DAEf8gZGu
         V3McSh6MElK3aYrtL9bvl6p5shJhlFU3WKwvrTlS87rDQdHwqhHqbDEOmPl5krckxZ9/
         leS55e+gRx65lNTYv8k4ZmZnH5qwXpwh+MYcCFC6ajmERz/782sEguJMrYL9j+K+/Dav
         HGmg==
X-Gm-Message-State: AOJu0YzCIL7M32YorMVo7nLcykCe28JyYuhTlP8Yobofdd3DywECVU14
	+1tuh+Lr9dy1HYegsCWYELA5PsdFLOOzwg==
X-Google-Smtp-Source: AGHT+IE9FGYEDur+LC9QK+q0jiqvWeaeJuZj9y2a5sRHEegDnx1iP4Dq9HHRAJQsZxfjZitFrFq/Nw==
X-Received: by 2002:ac8:5bc3:0:b0:429:a2e7:d602 with SMTP id b3-20020ac85bc3000000b00429a2e7d602mr1608728qtb.87.1704823288005;
        Tue, 09 Jan 2024 10:01:28 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5c0f:0:b0:429:a833:b753 with SMTP id i15-20020ac85c0f000000b00429a833b753ls637122qti.2.-pod-prod-06-us;
 Tue, 09 Jan 2024 10:01:27 -0800 (PST)
X-Received: by 2002:a05:622a:15d4:b0:427:916a:24c9 with SMTP id d20-20020a05622a15d400b00427916a24c9mr8434606qty.4.1704823287428;
        Tue, 09 Jan 2024 10:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823287; cv=none;
        d=google.com; s=arc-20160816;
        b=ar7qMKnKNmO+B302uDMf9LgJ4aV90+9oavDD9xdGGCLIBiBpTKl7ATM7pSnrVA4XZ4
         O3MVhqabMWKd2H88AYRdhEiC/b5DfF4wf1fOew4pXp0FtnDSkDBHF8be2pgUjJAdlcbz
         JnI4RAE9uZXO+vPnJG9vIXsiTfsOXnWYicuA5Ko/RIV+clsTnn3t//EXHLF4pdVLEMaG
         jYF1Uo/QjhWy/aV5jLoQrgyDMTiiqYG5Y4o32xCRAHgdrFT204TzPf2P/kEfethCHxbD
         rjMYEOSBp3TUL7+Y+rEo9yJT/C1kHcgjvOtca1SNosJs2rW7pCXN+2tohHmfv6IyLKxs
         kk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=4rPNlP6PBry4nxR9lAPdbGmX8a9PuS5yG2z2I/UMBB8=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=YQ9xeuhngWdiohAJ0nRISB0HYx+0ddridbGSfu2KwXqfM4QeCwQmdQMHhDhiHvFxw9
         6/WeSN9d/lHToXEZCdh3ZzV7d6UM8t066ZXpPHlb254azMs4lw5GLwql+IRdP644zeH6
         IowL1Cmg9k+mZJ4Bw1JYfjcR9i4Afw96JwJ+dAbwVFfq4rNDPEft5HtkYK0eDtRpQtoz
         qKENTMSixkQJm6NqrTykKBuzwjXw3GbIh7vc5LwCTYkVlImyOKp62rf3570dNSB5+yII
         QU7wS/TYzrs2bLidJ2oFtvTPGXsCftUBpCOj+AKd6sCC/45iqBRcbDl0AP/aQGQYUYn3
         lhCw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id t1-20020ac85881000000b004299f56af5fsi2435020qta.207.2024.01.09.10.01.27
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-iABYmHJhOVWXJ3TEJ2UC-g-1; Tue, 09 Jan 2024 13:01:25 -0500
X-MC-Unique: iABYmHJhOVWXJ3TEJ2UC-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2FE385A589
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 18:01:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B02563C2E; Tue,  9 Jan 2024 18:01:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAA253C39;
	Tue,  9 Jan 2024 18:01:22 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] netfs, afs, erofs, cifs: Don't use certain internal folio_*() functions
Date: Tue,  9 Jan 2024 18:01:11 +0000
Message-ID: <20240109180117.1669008-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Hi Christian, Willy,

Here are some patches that replace the use of folio_index(),
folio_mapping() and folio_file_mapping() in some filesystem code.  I'll add
them to my netfs-lib branch.

David

David Howells (4):
  netfs: Don't use certain internal folio_*() functions
  afs: Don't use certain internal folio_*() functions
  erofs: Don't use certain internal folio_*() functions
  cifs: Don't use certain internal folio_*() functions

 fs/afs/dir.c              | 10 +++++-----
 fs/erofs/fscache.c        |  6 +++---
 fs/netfs/buffered_read.c  | 12 ++++++------
 fs/netfs/buffered_write.c | 10 +++++-----
 fs/netfs/io.c             |  2 +-
 fs/netfs/misc.c           |  2 +-
 fs/smb/client/file.c      | 10 +++++-----
 7 files changed, 26 insertions(+), 26 deletions(-)

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

