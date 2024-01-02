Return-Path: <linux-cachefs+bncBDLIXLMFVAERBKG42CWAMGQEM2XBRCA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5E821EF0
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Jan 2024 16:39:22 +0100 (CET)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-594321bdebasf9107280eaf.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 02 Jan 2024 07:39:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704209961; cv=pass;
        d=google.com; s=arc-20160816;
        b=VIfQySr6n5FF/koDXYq00oBAbJHlJEfJ7iHlYQdQ21G6H9vp/3BYNc/iPNKH4yMKzt
         yaBogyH0Z8bQt+0yQZ5CgHk4ne3S7wjhN60Y4sLPM/7Q8Ljm+BH/h0zKvE8agjaCthLn
         YNWJIzkPPZBYyoW5xQYelKWE26ozNOrsqoCaar91qS6AK7Om8icM9QaPOPjOwF6W1QKg
         k7ckRw66e3gJsDF+tvviRMRzav9J7O7qW0Qu2rxMdRlkwaHRrFacx32MpGNl8HalxvL7
         5646kGr6iJzSogkXCQwdTsh+SypYZzu21/e4fgpIs1mq6yF0sRFnJRMX1ckF4nXg9j6l
         NXuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=yD0z0x1zydRfw4Yp7dFmo2+Zciuci/ipW7Zk7FziYFg=;
        fh=5wQSsK3NILBAKsw1M/Yw0hmfS3R0c/NIYQCEQz4yyXk=;
        b=IkgFctQr0MR+7hoWtEsaltXNmhZhFf/zgOZCz2zZJUUqZZiL/U4Tftv/fczUzQtJBB
         8rtkHTPNIkZjx5TOBePMGKdKm8NWcH+whNQ2+BBqgTJTGuKHMKNSqsruouxAEsFRpoJy
         oFpm7W12UByO0L74i2Akoy5esM9kk+e9+ry8seYT6ZlEnK9Di9DRxMdUuBcUgcCrrQju
         3ZEhhlL6SEjKI39x6g0Q3/nxos3XfgYDTn9sZgcC4wNhmXYJCOQhGIf9+1sHxt4fCAt/
         cbCN7mnd5rCgdWeLvma+x2Doo4u69/Bmaz2K/R+TtHRhcTMRaooPb9v5vh2QIkSeotV+
         8E/Q==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704209961; x=1704814761;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yD0z0x1zydRfw4Yp7dFmo2+Zciuci/ipW7Zk7FziYFg=;
        b=ti8AsRbr5AFWlUo0ZExtUrhPCrpLA8EpRT3UmV1OzuK1FTvOpy0667TXQgWheWg2Tt
         mpFNK0/IAQRtjehSpWOoozp6oGUg2tOCq8xOdnDbWaIokbyGWhcM1forVWUXGK4B338J
         iGkL4zOvpRbErQZfSPTY6dW/lMY4/0PVrD8V++Jrd7zW0J3LT85ReFzXflo9wOIwKzt4
         DIQDWYtNqy4PxMczITsTXA60+TCiOq5SlqFzK74o7P+oAFEQRiI9HuvuLa9FT+Nou3gL
         C3K+MqNk/rL93jt+ugfoKGoh7nyh9ghzbKRC85FdSiB6u0ND9KhXIldCw9uTHXkn/Hsc
         0yzw==
X-Gm-Message-State: AOJu0Yy7kDWp0uHHwAoNkUqBbe2+xBfZOJjqzjem016aKz5BQzxg0OUC
	AXaZjOx66p/OeyER7TGtyRwdlo4HQo4dOA==
X-Google-Smtp-Source: AGHT+IFmTe+H48v/iNwfOZMVW5gYktHBRyyT88O/AfPcIZDgI6E7J8d0S1Kybd2/FaXdJK/misubrA==
X-Received: by 2002:a05:6358:914d:b0:175:20af:ae03 with SMTP id r13-20020a056358914d00b0017520afae03mr4271173rwr.40.1704209960785;
        Tue, 02 Jan 2024 07:39:20 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:19aa:b0:428:13ff:68a7 with SMTP id
 u42-20020a05622a19aa00b0042813ff68a7ls444070qtc.0.-pod-prod-03-us; Tue, 02
 Jan 2024 07:39:20 -0800 (PST)
X-Received: by 2002:ac8:5714:0:b0:428:31be:a958 with SMTP id 20-20020ac85714000000b0042831bea958mr812398qtw.58.1704209960108;
        Tue, 02 Jan 2024 07:39:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704209960; cv=none;
        d=google.com; s=arc-20160816;
        b=ioWNNWaITWzEJNNrdajoWtA3Vvu5OmfQZORAEPf1ALOZaYDj8oUin9K4KuC/VLxxUE
         lkkbKGlBMDjYOxSgXdGD8liHri9Dz1EWOT4WDlm0dGMbaW1by2a9EshuSPNTpipZ+gdN
         adXesQB2PqArlZMuzqw/1zFrrq5MykvL1TCzxJsQ/T5VKXryN9rUewlU2Kyj6KDnKlbK
         nRdJM3zlGRfJ3hruBy4vd3V/yQjH0gene8mc9wh4GbzeiFIv/WeLk9OGzdiPAuxZDVZs
         uHTaJ1bmzZ1Dk04Isoa+HEBUN7fv7rm1XQDRJhLDdNAyWTEwgmxeIQOVde/ld4ehtby6
         oQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=LM7qdgWQDUzW1VNi9ViBduWaO+jG+K6dylQmR5RcPU8=;
        fh=5wQSsK3NILBAKsw1M/Yw0hmfS3R0c/NIYQCEQz4yyXk=;
        b=OYxJKjiTFIDn5Sd7tv87cNYpuwlz9vnXFejIyoyw6t/Mn05LNN9oVGuYBTK91xcdy7
         p0ZQrMeRbdv4GWoxN5CWECiggSTALY3EYflhH9h+1mpNeQa5UublTJYp+hKh1BlX95Uq
         9aKtcLdkUBA/t7M8hDbI0+SayROZsTkAv6+B3KyiS/5SG7CBSOSLAQ6Pc0fOdeEpIGSH
         xHZL9kUVQgvhRWQizCxa7X8bVmRh0DNKFJl7+R0bT6Jwr4p24esp7kKffV/vGGZD/sX6
         7Rfwe241zQ0z5Z2pJAUSJp60OLwNLqGG5qydbx9tblV4F/OyPMXVN700+IUaNlka7EuL
         fGgA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g4-20020ac87f44000000b0042551f4f996si28486896qtk.201.2024.01.02.07.39.19
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:39:20 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-HbDmys1TNAelnuTeD6DgNQ-1; Tue,
 02 Jan 2024 10:39:18 -0500
X-MC-Unique: HbDmys1TNAelnuTeD6DgNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10D6E29AC018
	for <linux-cachefs@gapps.redhat.com>; Tue,  2 Jan 2024 15:39:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0AE152166B32; Tue,  2 Jan 2024 15:39:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BB9C2166B31;
	Tue,  2 Jan 2024 15:39:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-41-dhowells@redhat.com>
References: <20231221132400.1601991-41-dhowells@redhat.com> <20231221132400.1601991-1-dhowells@redhat.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
    Latchesar Ionkov <lucho@ionkov.net>,
    Dominique Martinet <asmadeus@codewreck.org>
Cc: dhowells@redhat.com, Christian Schoenebeck <linux_oss@crudebyte.com>,
    Jeff Layton <jlayton@kernel.org>,
    Matthew Wilcox <willy@infradead.org>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 40/40] 9p: Use netfslib read/write_iter
MIME-Version: 1.0
Date: Tue, 02 Jan 2024 15:39:14 +0000
Message-ID: <141745.1704209954@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <141744.1704209954.1@warthog.procyon.org.uk>
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

Hi Eric, Latchesar, Dominique,

Would you have any chance to look at the 9p patch before the merge window
opens?  If not, what should I do with the patch?  Should I keep it, or should
I drop it for now and give it to you to take through the 9p tree if Linus
accepts the rest of the patchset?

Thanks,
David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

