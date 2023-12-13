Return-Path: <linux-cachefs+bncBDLIXLMFVAERBD4546VQMGQEEP77Y3I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id C500F8116F1
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:32:32 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-589ce3eb26csf8595806eaf.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:32:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481551; cv=pass;
        d=google.com; s=arc-20160816;
        b=eSPBEcAHqaunPFj6h2VJQehMtIuzSBKEaoMdTrn2rnEYQEStvHTxDhs3uA5d0Ja0Ln
         zMpYFj+rZL7jkAwUI2B9WaNC3ZwcWofTrqXeQGa1/7ltdPVbIxMsQtnEFMAw8rSMF6/a
         ZZ1WBQKX8Z2sdgIgHiDDhlfgD6+mYTmnPLT5RyubSi6qxuMkEw89uY6t5GksAeoC9W8M
         EuaQqr3svCodNYYioXAFRBoISuhQ2NzISPOBSToULEApB+L+3IWxHpkAM49JHrAjbFRk
         siwa82x0xsftY6hfyYFqCWXYJEU1NKgom8T5Cm8aMEyuJW43o8FRn3dScm6Q6RktIvY6
         h7lA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=DfEu2sShWj0gEI1iUsUu1D+OyXM6EP4YiMFP6bfHOd0=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=EH+jr9W73I4plALpV0egXy9TSc7qYwbsJn9yYGWcll6rC31wv53YUZczByNhpuu7hG
         HaObU+Ut4kGOyDoL/WXQbFWBKpFsBTqXPAKeHd6oYSbTKzsux1s6W3azjhjRonHsBqK3
         QJByQiUvrmkP1xTRmIqUIQeYjOPNl3dK0lAJlhgZvmULhzO+jdlQGHrjLNHNOTO2lX+G
         kWhMpWVrqLiKDBsZjvJBK0vjelGrqXmIDJWu8hbeotPk49dzo8K9SpH3S9aWO0hEODgV
         8aT5E6Qos2ANKvOsdEJM6jKtCGBFhnePBnNgYbtkyJWBf4WWqn2aqIvsJLbTWPK2mZds
         5wtQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481551; x=1703086351;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DfEu2sShWj0gEI1iUsUu1D+OyXM6EP4YiMFP6bfHOd0=;
        b=cldIlR0GpMtjWjLoerX3z1Uos9NMBPT0JSQK9GnvNRQUDCg6/4/H8WHzwSkou44Od+
         13WQ11OZLnip4NzkMBgoATSQIuVKAzlR9u/bGzu8Ea8HfQTQGHI6jqi2vvw334G+LHEE
         InKH0iiH6AxK87a+OkSvGCju7B7Du/nQF2j6byswaXNaIdSlfD0Op+NvOkFASRteiNbW
         cVxpNI0hTP5sbVJGsRgLUiImRpYgBR1ZS7dyL6mnmBC8j7snXDTC+Lbk06fzjgtXuLIW
         eRyE6V9c9jGeyFhv0loDWjeAxTq1Z5+pR994oTvNPsh1HOR5yjsCqnKOcGNpqAuaPmHD
         S9jw==
X-Gm-Message-State: AOJu0Yyj5Z4DoN+qYDPO48x3V2vj2iJkgt77XnbrmM9EjVuUpBMejrBP
	BYHQdvqQwE45bXfrOE2VLBX4GQ==
X-Google-Smtp-Source: AGHT+IHdFTKpL5CLJJx2fvL6duoxHgSmfTDHmRB6s/zQbkw47xXIn9vst4lxQK6qy3i2hdB52VTpAg==
X-Received: by 2002:a4a:5551:0:b0:591:72:6cc0 with SMTP id e78-20020a4a5551000000b0059100726cc0mr4003804oob.16.1702481551696;
        Wed, 13 Dec 2023 07:32:31 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:605:b0:58d:6d88:2214 with SMTP id
 e5-20020a056820060500b0058d6d882214ls669065oow.2.-pod-prod-05-us; Wed, 13 Dec
 2023 07:32:31 -0800 (PST)
X-Received: by 2002:a05:6808:2381:b0:3b9:ef76:e060 with SMTP id bp1-20020a056808238100b003b9ef76e060mr10834809oib.78.1702481551050;
        Wed, 13 Dec 2023 07:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481551; cv=none;
        d=google.com; s=arc-20160816;
        b=iVb/Zk18Ws9fjQgpAGCLnPXtoQoltKqjbW4wZ09qThT9hQgSpEcGZAIQTXDSMlPQC4
         fULk4g8v2MjSHsmV4tiZp76lHDYLVTQEvYMqafQoO90JHDTml5cI48LthY42KDPB02b9
         b9hARaqIEHQh8HuZic7Dv+uOrjWqelAcFCp3gUE+Q09XTbeBovDk9N0SlC0lmklqUO9G
         0VrWHRU2sGU3UIabE8e64dugzW61fUcohJ7vwPmbSSY/5wNUEbbb3CrgYYsEm7dlRNYT
         1l0IB4JhT2huSXW37DvfPvNPTO5I14tySbjbJjoHy07DLfU53IQKP14rdGcLser8K/pn
         W/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=+hdM+h7N6TwHGhwIbks4CvwZuKV0xOWmxmNCull4QN4=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=HvvUU3eKRDShq7xorVPbrgvODYDikUQ6mSU+MOMYE2MH6ef/E/r+I2xArs2yUAvFXt
         jLEPEXO3Bf10guSTjeV6c1761z+F4c9JfIE41urZdIDQ4jI1qlprYtzZD0riRAxfQHt3
         4+eTP7IJb33jT6AkzmRgVU+CmEVzDJvpeK2wNvzVP53ieXOWDDWS0xsjxfs3GRE7PzS8
         zm6fXljUnuPAraiX7OUvXlSunbUZTgFPiMe8DqOW2g4cHSnh769YejYnqs6Dji3/nHH5
         iA3a1udWnWTSTg1C1cfwWKGFYKLcF1CGcZaoivtPe7BLs9oLvcTjpaDrFYFGTyCz2eu2
         5+5A==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id u19-20020a056102375300b0046621dc2f85si1562492vst.736.2023.12.13.07.32.30
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:32:31 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-GOYFccDLNH-fnTjXmPfNtQ-1; Wed, 13 Dec 2023 10:32:28 -0500
X-MC-Unique: GOYFccDLNH-fnTjXmPfNtQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B0E8101A551
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:32:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2537F2026F95; Wed, 13 Dec 2023 15:32:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EA702026D66;
	Wed, 13 Dec 2023 15:32:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3bf4a5126f84b56a28dbc5e8e643b24945578bbd.camel@kernel.org>
References: <3bf4a5126f84b56a28dbc5e8e643b24945578bbd.camel@kernel.org> <20231207212206.1379128-1-dhowells@redhat.com> <20231207212206.1379128-5-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/59] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
MIME-Version: 1.0
Date: Wed, 13 Dec 2023 15:32:24 +0000
Message-ID: <432338.1702481544@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <432337.1702481544.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Jeff Layton <jlayton@kernel.org> wrote:

> 
>    1. Are there known userland tools that rely on this path? I suppose
>       this is harmless either way though, and /proc is supposedly part
>       of the ABI.

I know various people have sent copies of the file in case of crashes, so it
feels like it should still be accessible by the old path.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

